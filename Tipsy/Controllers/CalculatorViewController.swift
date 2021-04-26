//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var bill = 0.0
    var result = 0.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        clearSelectedState()
        
        sender.isSelected = true
        
        let titleButton = sender.currentTitle ?? "0.0%"
        let changedTitleButton = String(titleButton.dropLast())
        let convertedTitleButton = Double(changedTitleButton)!
        tip = convertedTitleButton / 100
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        splitNumberLabel.text = String(value)
        
        numberOfPeople = value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if let value = billTextField.text{
            bill = Double(value) ?? 0.0
        }
        
        let tipAmount = bill * tip
        let totalBill = bill + tipAmount
        let dividedTotalBill = totalBill / Double(numberOfPeople)
        
        result = dividedTotalBill
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func clearSelectedState(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.tipPercentage = tip
            destinationVC.numberOfPeople = numberOfPeople
        }
    }
}

