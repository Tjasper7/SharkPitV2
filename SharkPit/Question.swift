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
    var image: UIImage
    
    init(questionTitle: String, description: String, image: UIImage) {
        self.questionTitle = questionTitle
        self.description = description
        self.image = image
    }
    
    convenience init(dictionary: NSDictionary) {
        let questionTitle = dictionary["caption"] as? String
        let description = dictionary["description"] as? String
        let photo = dictionary["imageName"] as? String
        let image = UIImage(named: photo!)?.decompressedImage
        self.init(questionTitle: questionTitle!, description: description!, image: image!)
    }
    
    class func allQuestions() -> [Question] {
        var questions = [Question]()
        if let URL = Bundle.main().urlForResource("Questions", withExtension: "plist") {
            if let photosFromPlist = NSArray(contentsOf: URL) {
                for dictionary in photosFromPlist {
                    let question = Question(dictionary: dictionary as! NSDictionary)
                    questions.append(question)
                }
            }
        }
        return questions
    }
}
