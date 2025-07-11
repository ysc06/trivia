import Foundation

extension String {
    var decoded: String {
        let data = Data(self.utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html
        ]
        if let attributed = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributed.string
        }
        return self
    }
}


//
//  String+HTMLDecode.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/10/25.
//

