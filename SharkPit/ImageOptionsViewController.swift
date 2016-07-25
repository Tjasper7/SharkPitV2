//
//  ImageOptionsViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 5/5/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

//TODO: Since updating to xCode 8 and swift 3 this logic is no longer working. Update for here and for profile page 

import UIKit

class ImageOptionsViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    let buttonCornerRadius : CGFloat = 6
    
    //MARK: Outlets
    @IBOutlet weak var camerRollButton: UIButton!
    @IBOutlet weak var createTableButton: UIButton!
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        
        self.takePictureButton.layer.cornerRadius = buttonCornerRadius
        self.createTableButton.layer.cornerRadius = buttonCornerRadius
        self.camerRollButton.layer.cornerRadius   = buttonCornerRadius
        self.settingsButton.layer.cornerRadius    = buttonCornerRadius
    }
        
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraRollButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            self.imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func takePictureButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            self.imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}
