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
    var blinkTimer = Timer()

    @objc func animate() {
        image.image = UIImage(named: "\(counter).gif")
        counter += 1
        
        if counter == 19 {
            counter = 0
        }
    }
    
    @IBAction func moveClick(_ sender: Any) {
        let iWidth = image.frame.width
        let iHeight = image.frame.height
        let iCornerX = image.frame.origin.x
        let iCornerY = image.frame.origin.y
        let amount :CGFloat = 200

        UIView.animate(
            withDuration: 1.5,
            delay: 0.0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.5,
            options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    self.image.frame = CGRect(
                        x: iCornerX,
                        y: iCornerY + amount,
                        width: iWidth,
                        height: iHeight
                    )
                }
            ) {
                finished in UIView.animate(
                    withDuration: 1.5,
                    delay: 0.5,
                    usingSpringWithDamping: 0.4,
                    initialSpringVelocity: 0.5,
                    options: UIView.AnimationOptions.curveEaseInOut,
                        animations: {
                            self.image.frame = CGRect(
                                x: iCornerX,
                                y: iCornerY,
                                width: iWidth,
                                height: iHeight
                            )
                        },
                        completion: nil
                )
            }
    }
    
    @objc func blinkAction() {
        image.isHidden = !image.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fadeInClick(_ sender: Any) {
        image.alpha = 1
        
        UIView.animate(
            withDuration: 1,
            animations: {
                self.image.alpha = 0
            }
        ) {
            finished in UIView.animate(
                withDuration: 1,
                delay: 0.5,
                animations: {
                    self.image.alpha = 1
                }
            )
        }
    }
    
    @IBAction func slideInClick(_ sender: Any) {
        UIView.animate(
            withDuration: 2,
            delay: 0.0,
            animations: (
                {
                    self.image.center = CGPoint(
                        x: self.image.center.x - 500,
                        y: self.image.center.y
                    )
                }
            )
        ) {
            finished in UIView.animate(
                withDuration: 0.75,
                delay: 0.3,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 1,
                options: UIView.AnimationOptions.curveEaseInOut,
                    animations: (
                        {
                            self.image.center = CGPoint(
                                x: self.image.center.x + 500,
                                y: self.image.center.y
                            )
                        }
                    )
            )
        }
    }
    
    func altGrow() {
        let iWidth = image.frame.width
        let iHeight = image.frame.height
        let iCenterX = image.center.x
        let iCenterY = image.center.y

        image.frame = CGRect(x: 0, y:0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1.3, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: ({self.image.frame = CGRect(x: iCenterX - (iWidth / 2), y: iCenterY - (iHeight / 2), width: iWidth, height: iHeight)}), completion: nil)
    }
    
    @IBAction func growClick(_ sender: Any) {
        let iWidth = image.frame.width
        let iHeight = image.frame.height
        
        UIView.animate(withDuration: 1.3, animations: {
            self.image.frame.size.width -= self.image.frame.size.width - 1
            self.image.frame.size.height -= self.image.frame.size.height - 1
        }) {
            finished in UIView.animate(withDuration: 1.3, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.image.frame.size.width += iWidth
                self.image.frame.size.height += iHeight
            })
        }
    }
    
    @IBAction func rotateClick(_ sender: Any) {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.5
        rotation.isCumulative = true
        rotation.repeatCount = 1
        image.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    @IBAction func blinkClick(_ sender: Any) {
        if blinkTimer.isValid {
            blinkTimer.invalidate()
            image.isHidden = false
        } else {
            blinkTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.blinkAction), userInfo: nil, repeats: true)
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

