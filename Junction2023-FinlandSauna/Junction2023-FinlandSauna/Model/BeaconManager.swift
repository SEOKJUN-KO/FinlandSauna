//
//  BeaconManager.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/20.
//
import CoreBluetooth
import SwiftUI

class BeaconManager: NSObject, ObservableObject, CBCentralManagerDelegate {

    private var centralManager: CBCentralManager!
    @Published var estimatedDistance: Double = 0.0
    @Published var estimatedDistanceMac: Double = 0
    @Published var RSSIIpad: Double = 0.0
    @Published var RSSIMac: Double = 0.0

    var iPadRSSI: Double = -26.0
    var macRSSI: Double = -26.0
    var estimatedDistIpad = 0.0
    var estimatedDistMac = 0.0
    private var rssiBufferIpad = [Double]()
    private var rssiBufferMac = [Double]()
    private let bufferSize = 5
    let wholeDistance: Double = 8.0
    var isStarted: Bool = false

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScanning() {
        centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        } else {
            print("Central manager is not in powered on state.")
        }
    }

    func centralManager(_: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData _: [String: Any], rssi RSSI: NSNumber) {
        print("peri:\(peripheral.name)")
        if let peripheralName = peripheral.name, peripheralName.contains("iPad") || peripheralName.contains("노트북") {
            if RSSI.doubleValue < 0 {
                if peripheralName.contains("노트북") {
                    macRSSI = RSSI.doubleValue
                    rssiBufferMac.append(macRSSI)
                    if rssiBufferMac.count > bufferSize {
                        rssiBufferMac.removeFirst()
                    }
                    RSSIMac = rssiBufferMac.reduce(0, +) / Double(rssiBufferMac.count)
//                    RSSIMac = macRSSI
//                    estimatedDistMac = calculateDistance(rssi: RSSI.doubleValue)
                    estimatedDistMac = calculateDistance(rssi: RSSIMac)
                } else {
                    iPadRSSI = RSSI.doubleValue
                    rssiBufferIpad.append(iPadRSSI)
                    if rssiBufferIpad.count > bufferSize {
                        rssiBufferIpad.removeFirst()
                    }
                    if estimatedDistIpad < 1.0 {
                        isStarted = true
                        print("isStarted!!")
                    }
                    if estimatedDistIpad >= 1.0 && isStarted == true {
                        print("hi")
                        isStarted = false
                        NetworkManager().putAPICall()
                        // 라벨 변경 api 호출
                    }
//                    RSSIIpad = iPadRSSI
//                    estimatedDistIpad = calculateDistance(rssi: RSSI.doubleValue)
                    RSSIIpad = rssiBufferIpad.reduce(0, +) / Double(rssiBufferIpad.count)
                    estimatedDistIpad = calculateDistance(rssi: RSSIIpad)
                }
                DispatchQueue.main.async {
                    withAnimation {
                        if self.estimatedDistIpad <= self.estimatedDistMac {
                            self.estimatedDistance = self.estimatedDistIpad
                            self.estimatedDistanceMac = self.wholeDistance - self.estimatedDistIpad
                        } else {
                            self.estimatedDistanceMac = self.estimatedDistMac
                            self.estimatedDistance = self.wholeDistance - self.estimatedDistMac
                        }
                    }
                }
            }
        }
    }

    func calculateDistance(rssi: Double) -> Double {
        let txPower = -59.0
        let ratio = (txPower - rssi) / 20.0
        return pow(10, ratio)
    }
}
