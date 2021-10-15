//
//  ViewController.swift
//  P2.Guess The Flag
//
//  Created by Ilija Partalov on 13.7.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String] ()
    var correctAnswer = 0
    var score = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia" , "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "us" , "uk"]
        
        //askQuestion(action: nil)
        // ili func askQuestion(action: UIAlertAction !=nil)
        //   \/
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = " \(countries[correctAnswer].uppercased()) Your Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
       // let uppercasedCountry = countries[correctAnswer].uppercased()
        // title = "Score: \(score) — Tap on: \(uppercasedCountry)'s flag." /* commented out to complete Project 3's challenge"
        //title = uppercasedCountry
        questionAsked += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        
        if questionAsked < 10 {
            let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
        } else {
            let finalAlertController = UIAlertController(title: "Game over!", message: "Your score is \(score).", preferredStyle: .alert)
            finalAlertController.addAction(UIAlertAction(title: "Start new game!", style: .default, handler: startNewGame))
            present(finalAlertController, animated: true)
        }
        
        func startNewGame(action: UIAlertAction) {
            score = 0
            questionAsked = 0
            
            askQuestion()
        }
        
        //func showScore() {
                //let scoreAlert = UIAlertController(title: "SCORE", message: nil, preferredStyle: .actionSheet)
               // scoreAlert.addAction(UIAlertAction(title: "Your current score is \(score)!", style: .default, handler: nil))
                
                //present(scoreAlert, animated: true)
    }

}
