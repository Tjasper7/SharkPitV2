//
//  Profile.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class Profile {
    var userName: String
    var age: String
    var location: String
    var skillLevel: String
    
    class func allProfileCellsPlist() -> [Profile] {
        var profiles = [Profile]()
        if let URL = Bundle.main().urlForResource("Profile", withExtension: "plist") {
            if let profilesFromPlist = NSArray(contentsOf: URL) {
                for dictionary in profilesFromPlist {
                    let profile = Profile(dictionary: dictionary as! NSDictionary)
                    profiles.append(profile)
                }
            }
        }
        return profiles
    }
    
    init(userName: String, age: String, location: String, skillLevel: String) {
        
        self.userName   = userName
        self.age        = age
        self.location   = location
        self.skillLevel = skillLevel
    }
    
    convenience init(dictionary: NSDictionary) {
        let userName    = dictionary["UserName"] as? String
        let age         = dictionary["Age"] as? String
        let location    = dictionary["Location"] as? String
        let skillLevel  = dictionary["SkillLevel"] as? String
        
        self.init(userName: userName!, age: age!, location: location!, skillLevel: skillLevel!)
    }
    
}


