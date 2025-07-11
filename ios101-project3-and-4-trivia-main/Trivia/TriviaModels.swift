//
//  TriviaModels.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/10/25.
//

import Foundation

struct TriviaResponse: Decodable {
    let response_code: Int
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Decodable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
