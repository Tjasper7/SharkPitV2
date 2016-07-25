//
//  DatabaseManager.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//


// TODO: Add Image into database

import UIKit

let sharedInstance = DatabaseManager()

class DatabaseManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Database.getPath("SharkPitDatabase.db"))
        }
        return sharedInstance
    }
    
    //MARK: Profile Functions ~~~~~~~~~~~~~~~~~
    
    func addProfileData(_ profile: Profile) -> Bool {
        sharedInstance.database?.open()
        let isProfileInserted = sharedInstance.database?.executeUpdate("INSERT INTO Profile_Table (Username, Age, Location) VALUES (?, ?, ?)", withArgumentsIn: [profile.userName, profile.age, profile.location])
        sharedInstance.database?.close()
        return isProfileInserted!
    }
    
    func upateProfileData(_ profile : Profile) -> Bool {
        sharedInstance.database?.open()
        let isProfileUpdated = sharedInstance.database?.executeUpdate("UPDATE Profile_Table SET Username=?, Age=? WHERE Profile=?", withArgumentsIn: [profile.userName, profile.age, profile.location])
        sharedInstance.database?.close()
        return isProfileUpdated!
    }
    
    func getAllProfileData() -> NSMutableArray {
        sharedInstance.database?.open()
        let resultSet: FMResultSet! = sharedInstance.database?.executeQuery("SELECT * FROM Profile_Table", withArgumentsIn: nil)
        let profileInfo = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let profile: Profile = Profile()
                //                var image: Data = UIImagePNGRepresentation(question.image)!
                profile.userName = resultSet.string(forColumn: "Username")
                profile.age      = resultSet.long(forColumn: "Age")
                profile.location = resultSet.string(forColumn: "Location")
                //                image = resultSet.data(forColumn: "Image")
                profileInfo.add(profile)
            }
        }
        sharedInstance.database?.close()
        return profileInfo
    }
    
    //MARK: Story Functions~~~~~~~~~~~~~~~~~~~~
    
    
    func addStoryData(_ story: Story) -> Bool {
        sharedInstance.database?.open()
        let isStoryInserted = sharedInstance.database?.executeUpdate("INSERT INTO Story_Table (Title, Description) VALUES (?, ?)", withArgumentsIn: [story.storyTitle, story.storyDescription])
        sharedInstance.database?.close()
        return isStoryInserted!
    }
    
    
    func upateStoryData(_ story: Story) -> Bool {
        sharedInstance.database?.open()
        let isUpdated = sharedInstance.database?.executeUpdate("UPDATE Story_Table SET Title=?, Description=? WHERE Story=?", withArgumentsIn: [story.storyTitle, story.storyDescription])
        sharedInstance.database?.close()
        return isUpdated!
    }
    
    func getAllStoryData() -> NSMutableArray {
        sharedInstance.database?.open()
        let resultSet: FMResultSet! = sharedInstance.database?.executeQuery("SELECT * FROM Story_Table", withArgumentsIn: nil)
        let allStoryInfo = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let story: Story = Story()
//                var imageData: Data = UIImagePNGRepresentation(story.storyImage)!
                story.storyTitle        = resultSet.string(forColumn: "Title")
                story.storyDescription  = resultSet.string(forColumn: "Description")
//                imageData = resultSet.data(forColumn: "Image")
                allStoryInfo.add(story)
            }
        }
        sharedInstance.database?.close()
        return allStoryInfo
    }
    
    //MARK: Question Functions~~~~~~~~~~~~~~~~~~
    
    
    
    func addQuestionData(_ question: Question) -> Bool {
        sharedInstance.database?.open()
        let isQuestionInserted = sharedInstance.database?.executeUpdate("INSERT INTO Question_Table (Title, Description) VALUES (?, ?)", withArgumentsIn: [question.questionTitle, question.description])
        sharedInstance.database?.close()
        return isQuestionInserted!
    }
    
    func upateQuestionData(_ question: Question) -> Bool {
        sharedInstance.database?.open()
        let isUpdated = sharedInstance.database?.executeUpdate("UPDATE Question_Table SET Title=?, Description=? WHERE Question=?", withArgumentsIn: [question.questionTitle, question.description])
        sharedInstance.database?.close()
        return isUpdated!
    }
        
    func getAllQuestionData() -> NSMutableArray {
        sharedInstance.database?.open()
        let resultSet: FMResultSet! = sharedInstance.database?.executeQuery("SELECT * FROM Question_Table", withArgumentsIn: nil)
        let allQuestionInfo = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let question: Question = Question()
//                var image: Data = UIImagePNGRepresentation(question.image)!
                question.questionTitle = resultSet.string(forColumn: "Title")
                question.description = resultSet.string(forColumn: "Description")
//                image = resultSet.data(forColumn: "Image")
                allQuestionInfo.add(question)
            }
        }
        sharedInstance.database?.close()
        return allQuestionInfo
    }
}

