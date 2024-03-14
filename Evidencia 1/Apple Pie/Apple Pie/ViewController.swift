//
//  ViewController.swift
//  Apple Pie
//
//  Created by Alumno on 04/03/24.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["buccaneer", "goku", "papu", "cringe", "based"]
    let incorrectMoves = 7
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLose = 0 {
        didSet{
            newRound()
        }
    }
    var currentGame: Game!
    
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var TreeImage: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var scoreLabel:UILabel!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    func newRound(){
        if(!listOfWords.isEmpty){
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMoves,
            guessedLetters: [])
            enableButtons(enable: true)
            updateUI()
        }else{
            enableButtons(enable: false)
        }
    }
    
    func updateUI(){
        correctLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLose)"
        TreeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState(){
        if(currentGame.incorrectMovesRemaining == 0){
            totalLose += 1
        }else if(currentGame.word == currentGame.formattedWord2){
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
    func enableButtons(enable: Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }


}

