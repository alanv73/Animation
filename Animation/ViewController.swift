//
//  ViewController.swift
//  Animation
//
//  Created by Alan Van Art on 1/21/20.
//  Copyright © 2020 Alan Van Art. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    var counter = 1
    var timer = Timer()
    
    @IBOutlet weak var btnStartStop: UIButton!
    
    @objc func animate() {
        image.image = UIImage(named: "\(counter).gif")
        counter += 1
        
        if counter == 19 {
            counter = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startClick(_ sender: Any) {
        if !timer.isValid {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            btnStartStop.setTitle("Stop Animation", for: [])
        } else {
            timer.invalidate()
            btnStartStop.setTitle("Start Animation", for: [])
        }
        
    }
    
    
}

