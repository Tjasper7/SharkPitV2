//
//  StoryCreateViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class StoryCreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var story: Story? 
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet var storyImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonCancelClicked(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Insert data when saveButtonPressed
    
    @IBAction func buttonSaveStoryClicked(_ sender: AnyObject) {
        let story: Story = Story()
            story.storyTitle = titleTextField.text!
            story.storyDescription = descriptionTextView.text
            let isInserted = DatabaseManager.getInstance().addStoryData(story)
            if isInserted == true {
                Database.invokeAlertMethod("Success", strBody: "Story was created", delegate: nil)
                dismiss(animated: true, completion: nil)
            } else {
                Database.invokeAlertMethod("Error", strBody: "Story was no created, please try again", delegate: nil)
        }
    }
    
    @IBAction func selectImageFromCameraRoll(_ sender: UITapGestureRecognizer) {
        print("Image Selected")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        storyImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
