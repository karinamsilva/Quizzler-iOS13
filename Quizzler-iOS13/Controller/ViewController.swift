//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var secondOptionButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {return}
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        firstOptionButton.setTitle(quizBrain.getButtonTitle(at: 0), for: .normal)
        secondOptionButton.setTitle(quizBrain.getButtonTitle(at: 1), for: .normal)
        thirdOptionButton.setTitle(quizBrain.getButtonTitle(at: 2), for: .normal)

        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstOptionButton.backgroundColor = .clear
        secondOptionButton.backgroundColor = .clear
        thirdOptionButton.backgroundColor = .clear
    }
    
}

