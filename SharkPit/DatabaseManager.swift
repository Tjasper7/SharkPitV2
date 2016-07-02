//
//  DatabaseManager.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//


// TODO: Add Image into database

import UIKit
import MapKit

let sharedInstance = DatabaseManager()

class DatabaseManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: StoryDatabase.getPath("SharkPitDB.db"))
        }
        return sharedInstance
    }
    
    func addStoryData(_ story: Story) -> Bool {
        sharedInstance.database?.open()
        let isInserted = sharedInstance.database?.executeUpdate("INSERT INTO Story_Info (Title, Description, Image) VALUES (?, ?, ?)", withArgumentsIn: [story.storyTitle, story.storyDescription, story.storyImage])
        sharedInstance.database?.close()
        return isInserted!
    }
    
    func upateStoryData(_ story: Story) -> Bool {
        sharedInstance.database?.open()
        let isUpdated = sharedInstance.database?.executeUpdate("UPDATE Story_Info SET Title=?, Description=?, Image=? WHERE Story=?", withArgumentsIn: [story.storyTitle, story.storyDescription, story.storyImage])
        sharedInstance.database?.close()
        return isUpdated!
    }
    
    func getAllStoryData() -> NSMutableArray {
        sharedInstance.database?.open()
        let resultSet: FMResultSet! = sharedInstance.database?.executeQuery("", withArgumentsIn: nil)
        let allStoryInfo = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let story: Story = Story()
                story.storyNumber       = resultSet.string(forColumn: "Story")
                story.storyTitle        = resultSet.string(forColumn: "Title")
                story.storyDescription  = resultSet.string(forColumn: "Description")
                story.storyImage        = resultSet.string(forColumn: "Image")
                allStoryInfo.add(story)
            }
        }
        sharedInstance.database?.close()
        return allStoryInfo
    }
}

