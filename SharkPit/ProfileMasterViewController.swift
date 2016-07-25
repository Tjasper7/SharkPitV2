//
//  ProfileMainViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileMasterViewController: UIViewController, FBSDKLoginButtonDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate , EditViewControllerDelegate {

//MARK: Outlets
    
    @IBOutlet var fbLoginButton: FBSDKLoginButton!
    @IBOutlet var yourStoryButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourStoryButton.layer.cornerRadius = 6
        if (FBSDKAccessToken.current() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
            fbLoginButton.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editSegue" {
            let editViewController = segue.destinationViewController as! EditProfileViewController
            editViewController.userName = nameLabel.text
            editViewController.age = ageLabel.text
            editViewController.location = locationLabel.text
            editViewController.editDelegate = self
        }
    }
            
    func setUserInformation(newUserName: String, newAge: String, newLocation: String) {
        nameLabel.text = newUserName
        ageLabel.text =  newAge
        locationLabel.text = newLocation
    }
    
//MARK: Image Picker
    
    @IBAction func selectPhotoFromCameraRoll(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
//MARK: Facebook
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        if error != nil {
            print(error)
        } else if result.isCancelled{
            // Handle canceling stuff
        } else {
            if result.grantedPermissions.contains("email") {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    
    }
    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.start( completionHandler: { (connection, result, error) -> Void in
            if error != nil {
                
            } else {
                print("fetched user: \(result)")
                let userName: String = result?.value(forKey: "name") as! String
                print("User Name is: \(userName)")
                let userEmail: String = result?.value(forKey: "email") as! String
                print("User Email is: \(userEmail)")
                
            }
        })
    }
    
    
    
}

