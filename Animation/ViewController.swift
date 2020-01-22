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
    @IBOutlet weak var btnStartStop: UIButton!

    var counter = 1
    var timer = Timer()

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
    
    
    @IBAction func fadeInClick(_ sender: Any) {
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {self.image.alpha = 1})
        
    }
    
    @IBAction func slideInClick(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    
    @IBAction func growClick(_ sender: Any) {
        let iWidth = image.frame.width
        let iHeight = image.frame.height
        let iCenterX = image.center.x
        let iCenterY = image.center.y
        
        image.frame = CGRect(x: 0, y:0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x: iCenterX - (iWidth / 2), y: iCenterY - (iHeight / 2), width: iWidth, height: iHeight)
        }
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

