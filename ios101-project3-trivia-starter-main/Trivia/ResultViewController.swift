//
//  ResultViewController.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/1/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!

    var finalScore = 0
    var totalQuestions = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "You got \(finalScore) out of \(totalQuestions) correct!"
    }

    @IBAction func restartTapped(_ sender: UIButton) {
        // Go back to the first screen
        self.navigationController?.popToRootViewController(animated: true)
    }
}
