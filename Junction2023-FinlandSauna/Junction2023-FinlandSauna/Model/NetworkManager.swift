//
//  NetworkManager.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/20.
//

import Foundation

struct PostData: Codable {
    var labelCode: String
    var color: String
    var duration: String
    var patternId: Int
    var multiLed: Bool
}

// drawString
//{
//    "articleId": "JC000004",
//    "articleName": "바부야",
//    "nfcUrl": "",
//    "eans": [],
//    "data": {
//        "ITEM_NAME": "바부야"
//    }
//}
struct DrawString: Codable {
    var articleId: String
    var articleName: String
    var data: Data
    
    struct Data: Codable {
        var ITEM_NAME: String
    }
}

class NetworkManager {
    func drawTranslate(translatedString: String) {
        print("드로우 ㄱㄱ")
        let token = "eyJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsiLCJ0eXAiOiJKV1QifQ.eyJpZHAiOiJMb2NhbEFjY291bnQiLCJvaWQiOiI2MzBlZDhlNS0zMTY0LTRkOTQtOWVlOS0xMWMxYzVjOGNkOTYiLCJzdWIiOiI2MzBlZDhlNS0zMTY0LTRkOTQtOWVlOS0xMWMxYzVjOGNkOTYiLCJuYW1lIjoicHNhbmd3b242MiIsIm5ld1VzZXIiOmZhbHNlLCJleHRlbnNpb25fQWRtaW5BcHByb3ZlZCI6dHJ1ZSwiZXh0ZW5zaW9uX0N1c3RvbWVyQ29kZSI6IkpDMTEiLCJleHRlbnNpb25fQ3VzdG9tZXJMZXZlbCI6IjEiLCJlbWFpbHMiOlsicHNhbmd3b242MkBnbWFpbC5jb20iXSwidGZwIjoiQjJDXzFfUk9QQ19BdXRoIiwiYXpwIjoiZTA4ZTU0ZmYtNWJiMS00YWU3LWFmZGUtYjljZGM4ZmEyM2FlIiwidmVyIjoiMS4wIiwiaWF0IjoxNjkyNDIwODkyLCJhdWQiOiJlMDhlNTRmZi01YmIxLTRhZTctYWZkZS1iOWNkYzhmYTIzYWUiLCJleHAiOjE2OTI1MDcyOTIsImlzcyI6Imh0dHBzOi8vc29sdW1iMmMuYjJjbG9naW4uY29tL2IwYzhlM2Q5LTA4ZmEtNDg3YS1hZmYxLTg1YmFlMTFmYzZjNS92Mi4wLyIsIm5iZiI6MTY5MjQyMDg5Mn0.dJDTBDZk-NwwZfXMrziDnn60BE5s_hHeMvc99F4VcFDSAiCbS8NmWRmfLH53kjsDyUn90zHH2zsRsjty2V8rcumNR28NJvFDdCk7kGpIKAyhggnsBfTJchwGtmZQYKPRsm1jebG_1kC-qZ-rtudcQNdr7F4tFzXJYdzcOlKbJ6zq9asHvQeuQbOG3umtzqD7qHNw6LHDv5W3IT84DBFlbigKFWAsa8UHpgAvPV-NI0c3RDDdritH5MgDW4QQItaYl6CiRl4grnBy6W9znU65EiTMUg3PZm6doCYhwsI5uPhh70M1JTMZEmygYwGotjZcQxtHysSRn-Ic2m5JhkH8HQ"
        let baseurl = "https://stage00.common.solumesl.com/"
        let urlString = "\(baseurl)common/api/v2/common/articles?company=JC11&store=1111"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Authorization 헤더에 토큰 추가
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONEncoder().encode([DrawString(articleId: "JC000001", articleName: translatedString, data: .init(ITEM_NAME: translatedString))]) else { return }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }.resume()
    }
    
    func putAPICall() {
        let token = "eyJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsiLCJ0eXAiOiJKV1QifQ.eyJpZHAiOiJMb2NhbEFjY291bnQiLCJvaWQiOiI2MzBlZDhlNS0zMTY0LTRkOTQtOWVlOS0xMWMxYzVjOGNkOTYiLCJzdWIiOiI2MzBlZDhlNS0zMTY0LTRkOTQtOWVlOS0xMWMxYzVjOGNkOTYiLCJuYW1lIjoicHNhbmd3b242MiIsIm5ld1VzZXIiOmZhbHNlLCJleHRlbnNpb25fQWRtaW5BcHByb3ZlZCI6dHJ1ZSwiZXh0ZW5zaW9uX0N1c3RvbWVyQ29kZSI6IkpDMTEiLCJleHRlbnNpb25fQ3VzdG9tZXJMZXZlbCI6IjEiLCJlbWFpbHMiOlsicHNhbmd3b242MkBnbWFpbC5jb20iXSwidGZwIjoiQjJDXzFfUk9QQ19BdXRoIiwiYXpwIjoiZTA4ZTU0ZmYtNWJiMS00YWU3LWFmZGUtYjljZGM4ZmEyM2FlIiwidmVyIjoiMS4wIiwiaWF0IjoxNjkyNDIwODkyLCJhdWQiOiJlMDhlNTRmZi01YmIxLTRhZTctYWZkZS1iOWNkYzhmYTIzYWUiLCJleHAiOjE2OTI1MDcyOTIsImlzcyI6Imh0dHBzOi8vc29sdW1iMmMuYjJjbG9naW4uY29tL2IwYzhlM2Q5LTA4ZmEtNDg3YS1hZmYxLTg1YmFlMTFmYzZjNS92Mi4wLyIsIm5iZiI6MTY5MjQyMDg5Mn0.dJDTBDZk-NwwZfXMrziDnn60BE5s_hHeMvc99F4VcFDSAiCbS8NmWRmfLH53kjsDyUn90zHH2zsRsjty2V8rcumNR28NJvFDdCk7kGpIKAyhggnsBfTJchwGtmZQYKPRsm1jebG_1kC-qZ-rtudcQNdr7F4tFzXJYdzcOlKbJ6zq9asHvQeuQbOG3umtzqD7qHNw6LHDv5W3IT84DBFlbigKFWAsa8UHpgAvPV-NI0c3RDDdritH5MgDW4QQItaYl6CiRl4grnBy6W9znU65EiTMUg3PZm6doCYhwsI5uPhh70M1JTMZEmygYwGotjZcQxtHysSRn-Ic2m5JhkH8HQ"
        let baseurl = "https://stage00.common.solumesl.com/"
        let urlString = "\(baseurl)common/api/v1/labels/contents/led?company=JC11"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // Authorization 헤더에 토큰 추가
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = """
        [
          {
            "labelCode": "0848A6E9E1DD",
            "color": "BLUE",
            "duration": "10s",
            "patternId": 0,
            "multiLed": false
          }
        ]
        """.data(using: .utf8)!

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
}
