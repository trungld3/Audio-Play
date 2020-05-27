//
//  ViewController.swift
//  Audio Play
//
//  Created by TrungLD on 5/27/20.
//  Copyright © 2020 TrungLD. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var timer = Timer()
     let audioPatch = Bundle.main.path(forResource: "yeulathathu", ofType: "mp3")
    @IBOutlet weak var play1: UIBarButtonItem!
    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var scruber: UISlider!
    var player = AVAudioPlayer()
    @objc func updateScruber() {
        scruber.value = Float(player.currentTime)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPatch!))
            
            scruber.maximumValue = Float(player.duration)
            
            
            
        } catch {
            // process any errors
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func stop(_ sender: Any) {
        scruber.value = 0
        timer.invalidate()
        player.pause()
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPatch!))
            
            
        } catch {
            // process any errors
        }
        
    }
    @IBAction func scrubberMove(_ sender: Any) {
        player.currentTime = TimeInterval(scruber.value)
        player.play()
        
    }
    @IBAction func play1(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1,target: self, selector: #selector(ViewController.updateScruber),userInfo: nil, repeats: true)
    }
    @IBAction func slidebtn(_ sender: Any) {
        player.volume = slide.value
    }
    @IBAction func playbtn(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pausebtn(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
}

