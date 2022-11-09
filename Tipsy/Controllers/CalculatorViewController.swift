//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    
    var tipCoefficient = 0.0;
    var guestsNumber = 2;
    var billSum = 0.0;
    var valuePerPerson = 0.0;
    
    @IBAction func billTextFieldChanged(_ sender: UITextField) {
        
        billSum = Double(billTextField.text!)!
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = "\(Int(sender.value))"
        guestsNumber = Int(sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        switch sender{
        case zeroPctButton:
            zeroPctButton.isSelected = true
        case tenPctButton:
            tipCoefficient = 0.1
            tenPctButton.isSelected = true
        case twentyPctButton:
            tipCoefficient = 0.2
            twentyPctButton.isSelected = true
        default:
            print("error occured")
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        valuePerPerson = (billSum * (tipCoefficient + 1.0))/Double(guestsNumber)
        print(valuePerPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.valuePerPerson = self.valuePerPerson
            destinationVC.guestsNumber = self.guestsNumber
            destinationVC.tipPercent = Int(self.tipCoefficient * 100.0)
        }
    }
}

