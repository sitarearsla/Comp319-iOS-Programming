//
//  ViewController.swift
//  sarslanturk16_hw2
//
//  Created by Sitare Arslantürk on 8.10.2019.
//  Copyright © 2019 Sitare Arslantürk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //  0 given to avoid init
    var randomNumber = 0
    var attemptCount = 3
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var attemptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playGame(_ sender: Any) {
        if(attemptCount==3 || attemptCount==0){
            startGameFromScratch()
        }
        
        if let guess = Int(guessTextField.text!){
            print(randomNumber)
            print(guess)
            
            if(guess<randomNumber){
                gameImageView.image = UIImage(named: "up")
                if(attemptCount==1){
                    resultLabel.text = "Sorry, You LOST, Answer: \(randomNumber)"
                    playButton.setTitle("PLAY NEW GAME", for: .normal)
                } else {
                    resultLabel.text = "Guess a bigger number"
                     playButton.setTitle("PLAY AGAIN", for: .normal)
                }
                attemptCount = attemptCount - 1
                attemptLabel.text = "Attempts left: \(attemptCount)"
                
                guessTextField.resignFirstResponder()
                guessTextField.text = ""
                
            } else if (guess>randomNumber){
                gameImageView.image = UIImage(named: "down")
                if(attemptCount==1){
                    resultLabel.text = "Sorry, You LOST, Answer: \(randomNumber)"
                    playButton.setTitle("PLAY NEW GAME", for: .normal)
                } else {
                    resultLabel.text = "Guess a smaller number"
                    playButton.setTitle("PLAY AGAIN", for: .normal)
                }
                attemptCount = attemptCount - 1
                attemptLabel.text = "Attempts left: \(attemptCount)"
                guessTextField.resignFirstResponder()
                guessTextField.text = ""
                
            } else if (guess==randomNumber){
                gameImageView.image = UIImage(named: "congrats")
                resultLabel.text = "CONGRATULATIONS"
                attemptCount = attemptCount - 1
                attemptLabel.text = "Attempts left: \(attemptCount)"
                playButton.setTitle("PLAY NEW GAME", for: .normal)
                attemptCount=3
                guessTextField.resignFirstResponder()
                guessTextField.text = ""
            }
        }
    }
    
    func startGameFromScratch () {
        randomNumber = Int.random(in: 1..<11)
        gameImageView.image = UIImage(named: "question_mark")
        resultLabel.text = "Guess a number between 1 and 10"
        playButton.setTitle("PLAY AGAIN", for: .normal)
        attemptCount = 3
        attemptLabel.text = "Attempts left: \(attemptCount)"
    }
}

