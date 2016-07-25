//
//  EditProfileViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 7/2/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import Foundation
import UIKit

protocol EditViewControllerDelegate {
    func setUserInformation(newUserName: String, newAge: String, newLocation: String)
}

class EditProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var ageTextfield: UITextField!
    @IBOutlet var locationTextfield: UITextField!
    
    var editDelegate: EditViewControllerDelegate!
    var userName: String!
    var age: String!
    var location: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.text = userName
        ageTextfield.text = age
        locationTextfield.text = location
        nameTextfield.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        nameTextfield.becomeFirstResponder()
    }
    
    //MARK: Actions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let profile: Profile = Profile()
        profile.userName = nameTextfield.text!
        profile.age = ageTextfield.hashValue
        profile.location = locationTextfield.text!
        let isInserted = DatabaseManager.getInstance().addProfileData(profile)
        if isInserted == true {
            editDelegate.setUserInformation(newUserName: nameTextfield.text!, newAge: ageTextfield.text!, newLocation: locationTextfield.text!)
            Database.invokeAlertMethod("Success", strBody: "Profile was updated", delegate: nil)
        } else {
            Database.invokeAlertMethod("Error", strBody: "Profile was not updated, please try again", delegate: nil)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        if nameTextfield.isFirstResponder() || ageTextfield.isFirstResponder() || locationTextfield.isFirstResponder() {
        resignFirstResponder()
        }
        self.dismiss(animated: true, completion: nil)
    }
}
