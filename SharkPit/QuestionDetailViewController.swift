//
//  QuestionDetailViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionDetailViewController : UIViewController {
    
    @IBOutlet private var questionImageView : UIImageView?
    @IBOutlet private var questionTitle : UILabel?
    @IBOutlet weak var questionDescription: UITextView!
    @IBOutlet weak var imageTapView: UIView!
    
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTapView.isUserInteractionEnabled = true
        
        if let question = question {
            navigationItem.title = "Question"
            self.questionTitle?.text = question.questionTitle
            self.questionImageView?.image = question.image
        }
    }
    
    // MARK: Actions 
    func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    // englarging image when tapped yeahhhh
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
        let newImageView = UIImageView(image: questionImageView!.image)
        newImageView.frame = self.view.frame
        newImageView.backgroundColor = UIColor.black()
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(QuestionDetailViewController.dismissFullscreenImage(sender:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
    }
    
    
}
