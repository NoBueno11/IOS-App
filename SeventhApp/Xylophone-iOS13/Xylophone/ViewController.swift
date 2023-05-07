//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        // Getting the sender title
        let soundName = sender.currentTitle
        
        // Opacity button
        sender.alpha = 0.5
        
        // Calling the function including the title parameter
        playSound(soundName: soundName!)
        
        // Bring opacity, back opacity
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            sender.alpha = 1.0
            
        }
    }
    
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}

