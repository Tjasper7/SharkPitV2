//
//  QuestionDataSource.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionsDataSource {
    
    private var questions: [Question] = []
    
    private var sections: [String] = []
    
    var count: Int {
        return questions.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: Public
    
    init() {
        questions = loadQuestionsFromDisk()
    }
    
    func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath: indexPath))
        }
        var newQuestions: [Question] = []
        for (index, question) in questions.enumerated() {
            if !indexes.contains(index) {
                newQuestions.append(question)
            }
        }
        questions = newQuestions
    }
    
    func indexPathForNewQuestion() -> NSIndexPath {
        let index = Int(arc4random_uniform(UInt32(questions.count)))
        let questionToCopy = questions[index]
        let newQuestion = Question(copying: questionToCopy)
        questions.append(newQuestion)
        questions.sort (isOrderedBefore: { $0.index < $1.index })
        return indexPathForQuestion(question: newQuestion)
    }
    
    func indexPathForQuestion(question: Question) -> NSIndexPath {
        let section = sections.index(of: question.section)!
        var item = 0
        for (index, currentQuestion) in questionsForSection(index: section).enumerated() {
            if currentQuestion === question {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func moveQuestionAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        if indexPath == newIndexPath {
            return
        }
        let index = absoluteIndexForIndexPath(indexPath: indexPath)
        let question = questions[index]
        question.section = sections[newIndexPath.section]
        let newIndex = absoluteIndexForIndexPath(indexPath: newIndexPath)
        questions.remove(at: index)
        questions.insert(question, at: newIndex)
    }
    
    func numberOfQuestionsInSection(index: Int) -> Int {
        let questions = questionsForSection(index: index)
        return questions.count
    }
    
    func questionForItemAtIndexPath(indexPath: NSIndexPath) -> Question? {
        if indexPath.section > 0 {
            let questions = questionsForSection(index: indexPath.section)
            return questions[indexPath.item]
        } else {
            return questions[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(indexPath: NSIndexPath) -> String? {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    // MARK: Private
    
    private func absoluteIndexForIndexPath(indexPath: NSIndexPath) -> Int {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfQuestionsInSection(index: i)
        }
        index += indexPath.item
        return index
    }
    
    private func loadQuestionsFromDisk() -> [Question] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main().pathForResource("Questions", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var questions: [Question] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let caption = dict["caption"] as! String
                        let description = dict["description"] as! String
                        let imageName = dict["imageName"] as! String
                        let section = dict["section"] as! String
                        let index = dict["index"] as! Int
                        let question = Question(caption: caption,description: description, imageName: imageName, section: section, index: index)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        questions.append(question!)
                    }
                }
                return questions
            }
        }
        return []
    }
    
    private func questionsForSection(index: Int) -> [Question] {
        let section = sections[index]
        let questionsInSection = questions.filter { (question: Question) -> Bool in
            return question.section == section
        }
        return questionsInSection
    }
    
}
