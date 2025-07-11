//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/9/25.
//

import Foundation

class TriviaQuestionService {
    func fetchQuestions(completion: @escaping ([TriviaQuestion]) -> Void) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors and unwrap data
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Decode the data
            do {
                let decoder = JSONDecoder()
                let triviaResponse = try decoder.decode(TriviaResponse.self, from: data)
                completion(triviaResponse.results)
            } catch {
                print("Decoding error: \(error)")
            }
        }

        task.resume()
    }
}
