//
//  ViewController.swift
//  BullsEye
//
//  Created by Mario Jackson on 9/21/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var currentRoundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var totalScore = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let possibleMaxRoundPoints = 100
        let playersPoints = difference == 0 ? 200 : possibleMaxRoundPoints - difference
        
        totalScore += playersPoints
        
        let message = "You scored \(playersPoints) points"
        
        let alert = UIAlertController(
            title: getAlertTitle(difference),
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 0...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        totalScoreLabel.text = String(totalScore)
        currentRoundLabel.text = String(round)
    }
    
    func getAlertTitle(_ difference: Int) -> String {
        let title: String
        
        switch difference {
        case 0:
            title = "Perfect!"
        case 0...5:
            title = "You almost had it!"
        case 6...10:
            title = "Not bad!"
        default:
            title = "Focus!"
        }
        
        return title
    }

}

