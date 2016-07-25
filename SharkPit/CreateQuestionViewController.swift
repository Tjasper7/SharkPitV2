//
//  CreateQuestionViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class CreateQuestionViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var titleTextField : UITextField!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    var newTableImage : UIImage?
    let imagePicker = UIImagePickerController()

    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField.delegate = self
        self.imageView.image = newTableImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
    }
    
    // MARK: UITextfieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        let question: Question = Question()
        question.questionTitle = titleTextField.text!
        question.description = descriptionTextView.text
        let isInserted = DatabaseManager.getInstance().addQuestionData(question)
        if isInserted == true {
            Database.invokeAlertMethod("Success", strBody: "Question was created", delegate: nil)
        } else {
            Database.invokeAlertMethod("Failure", strBody: "Question was not created. Try again", delegate: nil)
        }
    }
    @IBAction func tappedImage(_ sender: UITapGestureRecognizer) {
    
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = self.view.frame
        newImageView.backgroundColor = .black()
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateQuestionViewController.dismissFullscreenImage(_:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    //MARK: Camera Roll Picker 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.contentMode = .scaleToFill
            self.imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}
