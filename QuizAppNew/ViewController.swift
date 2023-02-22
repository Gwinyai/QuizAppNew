//
//  ViewController.swift
//  QuizAppNew
//
//  Created by Gwinyai Nyatsoka on 13/2/2023.
//

import UIKit

struct Question {
    let questionImage: UIImage
    let correctAnswer: Int
    let answer1: String
    let answer2: String
    let answer3: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    var score = 0
    var currentQuestionIndex = 0
    
    let questions = [
        Question(questionImage: UIImage(named: "lion")!, correctAnswer: 2, answer1: "Crocodile", answer2: "Lion", answer3: "Buffalo"),
        Question(questionImage: UIImage(named: "giraffe")!, correctAnswer: 1, answer1: "Giraffe", answer2: "Antelope", answer3: "Bird"),
        Question(questionImage: UIImage(named: "buffalo")!, correctAnswer: 3, answer1: "Lion", answer2: "Gazelle", answer3: "Buffalo")
    ]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! QuizResultsViewController
        destinationVC.score = score
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    func loadQuestion() {
        let question = questions[currentQuestionIndex]
        questionImageView.image = question.questionImage
        answer1Button.setTitle(question.answer1, for: .normal)
        answer2Button.setTitle(question.answer2, for: .normal)
        answer3Button.setTitle(question.answer3, for: .normal)
    }
    
    func check(answer: Int) {
        if questions[currentQuestionIndex].correctAnswer == answer {
            score += 1
            scoreLabel.text = "Score: \(score)"
            presentScoreAlert(title: "Correct!", message: "You got the right answer!")
        } else {
            presentScoreAlert(title: "Wrong :(", message: "You got the wrong answer.")
        }
        
    }
    
    func presentScoreAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if self.questions.count - 1 == self.currentQuestionIndex {
                self.performSegue(withIdentifier: "QuizResultsSegue", sender: nil)
                self.currentQuestionIndex = 0
                self.loadQuestion()
                self.score = 0
                self.scoreLabel.text = "Score: 0"
            } else {
                self.currentQuestionIndex += 1
                self.loadQuestion()
            }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    @IBAction func answer1ButtonTapped(_ sender: Any) {
        check(answer: 1)
    }
    
    @IBAction func answer2ButtonTapped(_ sender: Any) {
        check(answer: 2)
    }
    
    @IBAction func answer3ButtonTapped(_ sender: Any) {
        check(answer: 3)
    }
    
}

