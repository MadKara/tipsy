//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ihor Karalash on 22.04.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = 0.0
    var tipPercentage = 0.0
    var numberOfPeople = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = String("Split between \(numberOfPeople) people, with \(Int(tipPercentage * 100))% tip.")
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
