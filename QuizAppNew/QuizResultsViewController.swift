//
//  QuizResultsViewController.swift
//  QuizAppNew
//
//  Created by Gwinyai Nyatsoka on 17/2/2023.
//

import UIKit

class QuizResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    var score = 0
    var questionsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        resultsLabel.text = "\(score) / \(questionsCount)"
    }

}
