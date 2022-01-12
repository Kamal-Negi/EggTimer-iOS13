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
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var progessBar: UIProgressView!
    
    let eggs:[String:Int]=["Soft":300,"Medium":480,"Hard":720]
    var timer=Timer()
    
    var player:AVAudioPlayer!
    var totalTime=0
    var secondsPassed=0
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness=sender.currentTitle!
        
        secondsPassed=0
        totalTime=eggs[hardness]!
        
        labelText.text=hardness
        progessBar.progress=0.0
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(eggTimer), userInfo: nil, repeats: true)
        
    }
    @objc func eggTimer(){
        if(secondsPassed<totalTime){
            
            secondsPassed+=1
            progessBar.progress=Float(secondsPassed)/Float(totalTime)
        }
        else{
            timer.invalidate()
            labelText.text="DONE!"
            
            let url=Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
