//
//  ProfileMainViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileMasterViewController: UIViewController, FBSDKLoginButtonDelegate, UITableViewDelegate, UITableViewDataSource  {


    @IBOutlet var fbLoginButton: FBSDKLoginButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    @IBOutlet var profileTableView: UITableView!
    
    var profileItems : [String] = ["Tyler", "26", "Alabama"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFace()
    }

    func configureFace() {
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["public_profile" , "email", "user_friends"]
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).start(completionHandler: { (connection, result, error) -> Void in
            let firstName: String = result?.objectFor("first_name") as! String
            let lastName: String = result?.objectFor("last_name") as! String
            let pictureUrl = result?.objectFor("picture")?.objectFor("data")?.objectFor("url") as! String
            self.userNameLabel.text = "Welcome, \(firstName) \(lastName)"
            self.profileImage.image = UIImage(data: NSData(contentsOf: NSURL(string: pictureUrl)! as URL)! as Data)
        })
    }

    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {

    }
    
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected Cell \(indexPath.row)")
    }
    
}

