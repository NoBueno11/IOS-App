//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var timer = Timer()
    
    let eggTime = ["You chose the soft eggs": 5, "You chose the medium eggs": 8, "You chose the hard eggs": 12]
    
    var totalTime = 0
    
    var secondsPassed = 0
    
    var player = AVAudioPlayer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        
        var timeLeft = totalTime * 60
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            
            (Timer) in
            
            if self.secondsPassed < timeLeft {
                
                self.secondsPassed += 1
                
                self.progressBar.progress = Float(self.secondsPassed) / Float(timeLeft)

            } else {
                
                self.timer.invalidate()
                
                self.titleLabel.text = "YOUR EGGS ARE READY!"
                
                playSound()
                
            }
        }
        
        func playSound() {
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            
            player.play()
            
        }
    }
        
//        With if statement case:
        /*if hardness == "Soft" {

            print(softTime)

        } else if hardness == "Medium" {

            print(mediumTime)

        } else {

            print(hardTime)

        }*/
        
//        With switch statement case:
        /*switch hardness {
            
        case "Soft":
            print(softTime)
            
        case "Medium":
            print(mediumTime)
            
            default:
            print(hardTime)
            
        }*/
}

