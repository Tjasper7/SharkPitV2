//
//  StoryCreateViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class StoryCreateViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var storyInfo: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonSaveStoryClicked(_ sender: AnyObject) {
        let story: Story = Story()
//            story.storyNumber = storyInfo.storyNumber
            story.storyTitle = titleTextField.text!
            story.storyDescription = descriptionTextView.text
        let isInserted = DatabaseManager.getInstance().upateStoryData(story)
        if isInserted == true {
            print("Record INSERTED 👍🏼")
        } else {
            print("Record not inserted 😭")
        }
    }
}
