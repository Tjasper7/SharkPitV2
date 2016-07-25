
//
//  ViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionMasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var questions = [Question]()
    var questionData: NSMutableArray!
    var databaseManager: DatabaseManager?
    
    @IBOutlet var questionCollectionView: UICollectionView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getQuestionData()
        questionCollectionView.backgroundColor = UIColor.clear()
        questionCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: Helpers
    
    func getQuestionData() {
        questionData = NSMutableArray()
        questionData = DatabaseManager.getInstance().getAllQuestionData()
        questionCollectionView.reloadData()
    }
    
    //MARK: Actions
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
            
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath as IndexPath) as! QuestionCell
        let question = questionData.object(at: indexPath.row) as! Question
        cell.questionTitleLabel.text = question.questionTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Question at \(indexPath)")
    }
}
