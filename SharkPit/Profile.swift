//
//  Profile.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//


// THREE CLASSES: Profile , ProfileInformation, ProfileCell 

import UIKit

class Profile {
    var userName: String
    var age: String
    var location: String
    
    init(userName: String, age: String, location: String) {
        self.userName = userName
        self.age = age
        self.location = location
    }
    
}

class ProfileInformation: Equatable {

    let name: String
    var profileInfo: [Profile]
    
    init(name: String, profileInfo: [Profile]) {
        self.name = name
        self.profileInfo = profileInfo
    }
    
    static func listProfileInformation() {
        var profile = [Profile]()
        profile.append(Profile(userName: "Tyler Jasper", age: "26", location: "Alabama"))
    }
    
}

func ==(lhs: ProfileInformation, rhs: ProfileInformation) -> Bool {
    var isEqual = false
    if (lhs.name == rhs.name && lhs.profileInfo.count == rhs.profileInfo.count) {
        isEqual = true
    }
    return isEqual
}

class ProfileCell: UITableViewCell {
    
}


