//
//  ViewController.swift
//  AMAN2SEM
//
//  Created by MacStudent on 2020-01-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    let path = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var Scrubber: UISlider!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
    }
        catch{
            print(error)
        }
    }

    @IBAction func playSound(_ sender: UIBarButtonItem) {
    
    
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseSound(_ sender: UIBarButtonItem) {
          player.pause()
        timer.invalidate()
    }
    
    
    @IBAction func stopbutton(_ sender: UIButton) {
        player.stop()
    }
    @objc func updateScrubber(){
        
        Scrubber.value = Float(player.currentTime)
    }
    
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        
        player.volume = volumeSlider.value
       // print(aman)
        
    }
}

