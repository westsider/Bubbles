//
//  ViewController.swift
//  Bubbles
//
//  Created by Warren Hansen on 6/18/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle1: UIView!
    
    @IBOutlet weak var circle2: UIView!
    
    @IBOutlet weak var circle3: UIView!
    
    @IBOutlet weak var circle4: UIView!
    
    @IBOutlet weak var circle12: UIView!
    
    @IBOutlet weak var circle6: UIView!
    
    @IBOutlet weak var circle7: UIView!
    
    @IBOutlet weak var circle8: UIView!
    
    @IBOutlet weak var circle9: UIView!
    
    @IBOutlet weak var circle10: UIView!
    
    @IBOutlet weak var circle11: UIView!
    
    var annimator: UIDynamicAnimator!
    
    var topSnapBehavior:UISnapBehavior?
    
    // have something here with push if I csn annimate this to push around in a loose circle
    //https://stackoverflow.com/questions/22328761/ball-bouncing-moving-inside-an-invisble-box-ios-xcode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle6.isHidden = true
        circle7.isHidden = true
        //circle8.isHidden = true
        circle9.isHidden = true
        circle10.isHidden = true
        //circle11.isHidden = true
        annimator = UIDynamicAnimator(referenceView: view)

        let collisionBehavior = UICollisionBehavior(items: [circle1, circle2, circle3, circle4, circle6, circle7, circle8, circle9, circle10, circle11, circle12])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        annimator.addBehavior(collisionBehavior)
        
        push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 45, mag: 0.1)
        
        delay(seconds: 5.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 90, mag: 0.1)
        })
        
        delay(seconds: 10.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 180, mag: 0.1)
        })
        
        delay(seconds: 20.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 45, mag: 0.1)
        })
        
        delay(seconds: 30.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 90, mag: 0.1)
        })
        
        delay(seconds: 40.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 180, mag: 0.1)
        })
        
        delay(seconds: 50.0, completion: {
            self.push(items: [self.circle1, self.circle2, self.circle3, self.circle4], angle: 45, mag: 0.1)
        })
        
        // put this into an endless loop
        // 2nd group runs counter with different mag
        // study UIPushBehavior
    }
    
    func delay(seconds: Double, completion: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
    
    func push(items:[UIDynamicItem], angle:CGFloat, mag:CGFloat) {
        print("angle \(angle)")
        let push = UIPushBehavior(items: items, mode: .continuous)
        push.magnitude = mag
        //push.pushDirection = CGVector(dx: CGFloat(150), dy: CGFloat(300))
        push.setAngle(angle, magnitude: 0.3)
        annimator.addBehavior(push)
        delay(seconds: 3.0, completion: {
            push.active = false
        })
        
    }
    
    @IBAction func userPannedC1(_ sender: UIPanGestureRecognizer) {
        if topSnapBehavior != nil {
            annimator.removeBehavior(topSnapBehavior!)
        }

        switch sender.state {
        case .began, .changed:
            topSnapBehavior = UISnapBehavior(item: circle1, snapTo: sender.location(in: view))
            annimator.addBehavior(topSnapBehavior!)
        default:
            break
        }

    }
    
}

