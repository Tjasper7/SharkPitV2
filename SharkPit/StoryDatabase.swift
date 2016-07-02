//
//  StoryDatabase.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/19/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import Foundation
import UIKit

class StoryDatabase: NSObject {
    
    class func getPath(_ fileName: String) -> String {
        
        let documentsURL = FileManager.default().urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
        let fileURL = try! documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path!
    }
    
    class func copyFile(_ fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default()
        if !fileManager.fileExists(atPath: dbPath) {
            
            let documentsURL = Bundle.main().resourceURL
            let fromPath = try! documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path!, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            if (error != nil) {
                print("error Occured 👎🏼")
            } else {
                print("Successful Copy 👍🏼")

            }
        }
    }
    
    class func invokeAlertMethod(_ strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
        let alert: UIAlertView = UIAlertView()
        alert.message = strBody as String
        alert.title = strTitle as String
        alert.delegate = delegate
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
    
}
