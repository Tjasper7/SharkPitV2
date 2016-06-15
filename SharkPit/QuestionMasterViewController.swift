
//
//  ViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionMasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var questions = Question.allQuestions()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Actions
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
            
    }
    
    //MARK: Segues from CreateQuestion 
    
    @IBAction func createQuestionSaveButtonTapped(segue: UIStoryboardSegue) {
        
        // Add question to collectionView
//        let indexPath = questionsDataSource.indexPathForNewQuestion()
//        collectionView?.insertItems(at: [indexPath as IndexPath])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Question Item")
    }
}
