//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alessio on 5/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
        
    var totalAmount: String = "0.0"
    var numberOfPeople: Int = 2
    var tipPercentage: Int = 10
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        totalLabel.text = totalAmount
        
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip!"
        
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        
        dismiss(animated: true)
            
    }
}
