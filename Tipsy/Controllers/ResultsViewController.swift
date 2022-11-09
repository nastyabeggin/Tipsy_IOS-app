//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Анастасия Бегинина on 09.11.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var valuePerPerson = 0.0;
    var guestsNumber = 0;
    var tipPercent = 0;
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(Double(round(100 * valuePerPerson) / 100))"
        settingsLabel.text = "Split between \(guestsNumber) people with \(tipPercent)% tip"
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
