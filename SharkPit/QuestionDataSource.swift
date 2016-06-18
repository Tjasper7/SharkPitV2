//
//  QuestionDataSource.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/15/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import Foundation
import UIKit

class QuestionDataSource {
    init() {
        populateData()
    }
    
    var questions: [Question] = []
    var section: [String] = []
    
    func numberOfRowsInEachSection(index: Int) -> Int {
        return questionsInSection(index: index).count
    }
    
    func numberOfSections() -> Int {
        return section.count
    }
    
    func getSectionTitleAtIndex(index: Int) -> String {
        return section[index]
    }
    
    func questionsInSection(index: Int) -> [Question] {
        let item = section[index]
        let filterQuestions = questions.filter {
            (question: Question) -> Bool in
            return question.section == item
        }
        return filterQuestions
    }
    
//    func allQuestions() -> [Question] {
//        var questions = [Question]()
//        if let URL = Bundle.main().urlForResource("Questions", withExtension: "plist") {
//            if let photosFromPlist = NSArray(contentsOf: URL) {
//                for dictionary in photosFromPlist {
//                    let question = Question(dictionary: dictionary as! NSDictionary)
//                    questions.append(question)
//                }
//            }
//        }
//        return questions
//    }
    
    func populateData() {
        if let path = Bundle.main().pathForResource("Questions", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let questionTitle = dict["caption"] as? String
                        let description = dict["description"] as? String
                        let section = dict["section"] as? String
                        let photo = dict["imageName"] as? String
                        let image = UIImage(named: photo!)?.decompressedImage
                        let question = Question(questionTitle: questionTitle!, description: description!, section: section!, image: image!)
                        questions.append(question)
                    }
                }
            }
        }
    }
}
