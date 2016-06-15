//
//  Story.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class Story {

    var storyTitle: String
    var story: String
    var image: UIImage
    
    init(storyTitle: String, story: String, image: UIImage) {
        self.storyTitle = storyTitle
        self.story = story
        self.image = image
    }
    
    convenience init(dictionary: NSDictionary) {
        let storyTitle = dictionary["StoryTitle"] as? String
        let story = dictionary["Story"] as? String
        let photo = dictionary["Photo"] as? String
        let image = UIImage(named: photo!)?.decompressedImage
        self.init(storyTitle: storyTitle!, story: story!, image: image!)
    }
    
    class func allStories() -> [Story] {
        var stories = [Story]()
        if let URL = Bundle.main().urlForResource("Story", withExtension: "plist") {
            if let photosFromPlist = NSArray(contentsOf: URL) {
                for dictionary in photosFromPlist {
                    let story = Story(dictionary: dictionary as! NSDictionary)
                    stories.append(story)
                }
            }
        }
        return stories
    }
}
