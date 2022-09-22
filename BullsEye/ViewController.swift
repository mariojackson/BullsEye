//
//  ViewController.swift
//  BullsEye
//
//  Created by Mario Jackson on 9/21/22.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(
            title: "Current Value",
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
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}

