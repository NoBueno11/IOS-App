//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var splitValue: Int = 2
    var billAmount: String = "0.0"
    var tipPercentage: Double = 0.1
    var billTotal: Double = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        billTextField.endEditing(true)
        
        updateUI()
        sender.isSelected = true
        
        tipPercentage = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value).replacingOccurrences(of: ",", with: ".")
        
        splitValue = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            
            billTotal = Double(bill.replacingOccurrences(of: ",", with: "."))!
            
            let result = billTotal * (1 + tipPercentage) / Double(splitValue)
            
            billAmount = String(format: "%.2f", result)
            
        } else {
            
            print("SOmenthings gone wrong!")
            
        }
        
        //Trigger the segue to transition to the ResultsViewController
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    func updateUI() {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            //Pass the values to the ResultViewController
            destinationVC.totalAmount = billAmount
            destinationVC.numberOfPeople = splitValue
            destinationVC.tipPercentage = Int(tipPercentage * 100)

        }
    }
}

