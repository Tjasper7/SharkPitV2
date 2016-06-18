//
//  Question.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//
import UIKit

class Question {
    
    var questionTitle: String
    var description: String
    var section: String
    var image: UIImage
    
    init(questionTitle: String, description: String, section: String, image: UIImage) {
        self.questionTitle = questionTitle
        self.description = description
        self.section = section
        self.image = image
    }
    
    convenience init(dictionary: NSDictionary) {
        let questionTitle = dictionary["caption"] as? String
        let description = dictionary["description"] as? String
        let section = dictionary["section"] as? String
        let photo = dictionary["imageName"] as? String
        let image = UIImage(named: photo!)?.decompressedImage
        self.init(questionTitle: questionTitle!, description: description!, section: section!, image: image!)
    }
}
