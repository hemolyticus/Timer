//
//  ViewController.swift
//  Timer
//
//  Created by Mel John del Barrio on 7/02/17.
//  Copyright © 2017 Mel John del Barrio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var lblCount: NSTextField!
    @IBOutlet weak var goButton: NSButton!
    @IBOutlet weak var txtMaxValue: NSTextField!
    
    @IBOutlet weak var level: NSLevelIndicator!


   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear() {
        timer.invalidate()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func timerFired()
    {
        counter = counter + 1
        if counter < (txtMaxValue.integerValue + 1) {
            level.doubleValue = Double(counter)
            lblCount.integerValue = counter
        }
        else
        {
            let sound  = NSSound(named: "Glass.aiff")
            sound?.play()
            timer.invalidate()
        }
    }
    
    @IBAction func btnGo(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFired), userInfo: nil, repeats: true)
        
        counter = 0
        level.doubleValue = Double(counter)
        lblCount.integerValue = counter
    }
    
    
    @IBAction func btnStop(_ sender: Any) {
        timer.invalidate()
    }

    
    @IBAction func actionTimerValue(_ sender: NSTextField) {
        
        if sender.integerValue > 0
        {
            goButton.isEnabled = true
            level.doubleValue = 0.0
            level.maxValue = sender.doubleValue
            level.warningValue = sender.doubleValue - sender.doubleValue / 5
            level.criticalValue = sender.doubleValue - sender.doubleValue / 10
        }
    }
    
    
}

