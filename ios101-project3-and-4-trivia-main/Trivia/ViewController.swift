//
//  ViewController.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/1/25.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}

class ViewController: UIViewController {
    @IBAction func resetGameTapped(_ sender: UIButton) {
        loadQuestions()
        correctAnswers = 0
        currentIndex = 0
    }
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    let service = TriviaQuestionService()
    var questions: [Question] = []
    var currentIndex = 0
    var correctAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentIndex = 0
        correctAnswers = 0
        loadQuestions()
    }

    func loadQuestions() {
        service.fetchQuestions { triviaQuestions in
            DispatchQueue.main.async {
                self.questions = triviaQuestions.map { trivia in
                    var allAnswers = trivia.incorrect_answers + [trivia.correct_answer]
                    allAnswers.shuffle()
                    return Question(
                        text: self.decodeHTML(trivia.question),
                        answers: allAnswers,
                        correctAnswer: trivia.correct_answer.decoded
                    )
                }
                self.showQuestion()
            }
        }
    }

    func showQuestion() {
        guard currentIndex < questions.count else { return }

        let q = questions[currentIndex]
        questionLabel.text = q.text

        // Show buttons based on number of answers
        let answerButtons = [answerButton1, answerButton2, answerButton3, answerButton4]
        
        for (index, button) in answerButtons.enumerated() {
            if index < q.answers.count {
                button?.isHidden = false
                button?.setTitle(q.answers[index], for: .normal)
            } else {
                button?.isHidden = true
            }
        }
    }

    func decodeHTML(_ htmlString: String) -> String {
        let data = Data(htmlString.utf8)
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html
        ]

        
        return (try? NSAttributedString(data: data, options: options, documentAttributes: nil))?.string ?? htmlString
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        guard currentIndex < questions.count else { return }

        if sender.currentTitle == questions[currentIndex].correctAnswer {
            correctAnswers += 1
        }

        currentIndex += 1

        if currentIndex < questions.count {
            showQuestion()
        } else {
            showFinalScore()
        }
    }

    func showFinalScore() {
        let alert = UIAlertController(title: "Game Over", message: "Your score: \(correctAnswers)/\(questions.count)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { _ in
            self.loadQuestions()
            self.correctAnswers = 0
            self.currentIndex = 0
        }))
        present(alert, animated: true)
    }
}
