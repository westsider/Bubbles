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
    
    var annimator: UIDynamicAnimator!
    
    var topSnapBehavior:UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        annimator = UIDynamicAnimator(referenceView: view)

        let collisionBehavior = UICollisionBehavior(items: [circle1, circle2, circle3])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        annimator.addBehavior(collisionBehavior)
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

