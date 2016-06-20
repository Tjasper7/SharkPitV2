//
//  TableLayoutViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/19/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import SpriteKit

class TableLayoutViewController : UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet weak var poolTableView: UIImageView!
    @IBOutlet weak var oneBall: UIView!
    @IBOutlet weak var twoBall: UIView!
    @IBOutlet weak var threeBall: UIView!
    @IBOutlet weak var fourBall: UIView!
    @IBOutlet weak var fiveBall: UIView!
    @IBOutlet weak var sixBall: UIView!
    @IBOutlet weak var sevenBall: UIView!
    @IBOutlet weak var eightBall: UIView!
    
    
    let createQuestionViewController = CreateQuestionViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.poolTableView.image = UIImage(named: "tableGrid")

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // round the balls
        roundedBalls()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveTableLayoutSegue" {
            let nav = segue.destinationViewController as! UINavigationController
            let createViewController = nav.topViewController as! CreateQuestionViewController
            createViewController.newTableImage = captureScreenShotMethod()
        }
    }
    
    // round the balls
    func roundedBalls() {
        
        self.oneBall.layer.cornerRadius = self.oneBall.frame.width / 2
        self.twoBall.layer.cornerRadius = self.twoBall.frame.width / 2
        self.threeBall.layer.cornerRadius = self.threeBall.frame.width / 2
        self.fourBall.layer.cornerRadius = self.fourBall.frame.width / 2
        self.fiveBall.layer.cornerRadius = self.fiveBall.frame.width / 2
        self.sixBall.layer.cornerRadius = self.sixBall.frame.width / 2
        self.sevenBall.layer.cornerRadius = self.sevenBall.frame.width / 2
        self.eightBall.layer.cornerRadius = self.eightBall.frame.width / 2
        self.oneBall.clipsToBounds = true
        self.twoBall.clipsToBounds = true
        self.threeBall.clipsToBounds = true
        self.fourBall.clipsToBounds = true
        self.fiveBall.clipsToBounds = true
        self.sixBall.clipsToBounds = true
        self.sevenBall.clipsToBounds = true
        self.eightBall.clipsToBounds = true
    }
    

    // MARK: Screenshot 

    // capture screenshot of window, return that, pass it in prepare for segue to createQuestion.
    func captureScreenShotMethod() -> UIImage {
        let window: UIWindow! = UIApplication.shared().keyWindow
        let windowImage = window.captureScreenShot()
        
        // set image to createQuestion imageView
        
        let finalImage = windowImage
        
        UIImageWriteToSavedPhotosAlbum(windowImage, nil, nil, nil)
        return finalImage
    }
    
   
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func panGestureBall(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    // MAKR: Helpers
    
    func returnBallToStartPoint() {
    // TODO: create helper to return ball to starting point if not inside tableview
    }
}
