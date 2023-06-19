//
//  ViewController.swift
//  Stopwatch
//
//  Created by Dharamveer Kanda on 16/6/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitleColor(UIColor.green, for: .normal)
        
        
       
    }
    
    
    @IBAction func startStopTapped(_ sender: Any)
    {
        if (timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startButton.setTitle("START", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
            
            
        }
        else{
            timerCounting = true
            startButton.setTitle("STOP", for: .normal)
            startButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,selector: #selector(timerCount), userInfo: nil, repeats: true)
            
        }
        
        
    }
    
    @IBAction func resetTapped(_ sender: Any)
    {
        timer.invalidate()
        
        count = 0
        timerCounting = false
        timerDisplay.text = createDisplayString(hours: 0, minutes: 0, seconds: 0)
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(UIColor.green, for: .normal)
        
    }
    @objc func timerCount()-> Void
    {
        count = count + 1
        let time = createDisplayFormat(seconds: count)
        let timeString = createDisplayString(hours: time.0, minutes: time.1, seconds: time.2)
        timerDisplay.text = timeString
    }
    
    func createDisplayFormat(seconds: Int)-> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
        
    }
    
    func createDisplayString(hours: Int, minutes: Int, seconds : Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
        
        
    }
    
}
