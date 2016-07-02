//
//  YourStoryViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 7/1/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import Foundation
import UIKit

class YourStoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set textview to be story if saved one has been presented.
    }
    
    //MARK: Outlets
    @IBOutlet var yourStoryTextview: UITextView!
    
    //MARK: Actions
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonSavePressed(_ sender: AnyObject) {
        // Save story
    }
    
}
