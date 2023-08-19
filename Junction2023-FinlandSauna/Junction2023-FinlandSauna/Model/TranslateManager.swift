//
//  TranslateManager.swift
//  Junction2023-FinlandSauna
//
//  Created by 정승균 on 2023/08/19.
//

import Foundation
import MLKitTranslate

class TranslatorManager: ObservableObject {
    let translator: Translator
    @Published var translatedString: String = ""
    
    init(sourceLanguage: Languages, targetLanguage: Languages) {
        print("target: \(targetLanguage), source: \(sourceLanguage)")
        // Create an English-German translator:
        let options = TranslatorOptions(sourceLanguage: sourceLanguage.translateLanguage, targetLanguage: targetLanguage.translateLanguage)
        self.translator = Translator.translator(options: options)
        checkUseTranslator()
    }
    
    func checkUseTranslator() -> Bool {
        var canUseTranslator = false
        
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false,
            allowsBackgroundDownloading: true
        )
        
        translator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }
            
            // Model downloaded successfully. Okay to start translating.
            print("다운로드 성공")
            canUseTranslator = true
        }
        
        return canUseTranslator
    }
    
    func doTranslate(text: String) -> String {
        var translatedString: String = ""
        
        translator.translate(text) { translatedText, error in
            guard error == nil, let translatedText = translatedText else { return }
            
            // Translation succeeded.
            
            self.translatedString = translatedText
            translatedString = translatedString
            print(translatedText)
            print("클래스: \(translatedString)")
        }
        
        return translatedString
    }
}
