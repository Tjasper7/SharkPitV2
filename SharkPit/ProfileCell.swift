//
//  ProfileCell.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var skillLevelLabel: UILabel!
    
    var profile: Profile? {
        didSet {
            if let profile = profile {
                userNameLabel.text = profile.userName
                ageLabel.text = profile.age
                locationLabel.text = profile.location
                skillLevelLabel.text = profile.skillLevel
            }
        }
    }
}
