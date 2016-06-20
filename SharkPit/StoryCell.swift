//
//  StoryCell.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var storyDescriptionLabel: UILabel!
    
    var story: Story? {
        didSet {
            if let story = story {
//                storyImageView.image = story.storyImage
                storyTitleLabel.text = story.storyTitle
                storyDescriptionLabel.text = story.storyDescription
            }
        }
    }
}
