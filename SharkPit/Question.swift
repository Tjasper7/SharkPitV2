//
//  Question.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class Question {
    var caption : String
    var description : String
    var imageName : String
    var section : String
    var index : Int
    
    init?(caption: String, description: String, imageName: String, section: String, index: Int) {
        self.caption = caption
        self.description = description
        self.imageName = imageName
        self.section = section
        self.index = index
        
        if caption.isEmpty || description.isEmpty {
            return nil
        }
    }
    
    convenience init(copying question: Question) {
        self.init(caption: question.caption, description: question.description, imageName: question.imageName,section: question.section, index: question.index)!
    }
}
