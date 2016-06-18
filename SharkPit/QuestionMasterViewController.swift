
//
//  ViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionMasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    let dataSource = QuestionDataSource()
    var question : Question?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfRowsInEachSection(index: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        let questions: [Question] = dataSource.questionsInSection(index: indexPath.section)
        let question = questions[indexPath.row]
        
        cell.questionTitleLabel.text = question.questionTitle
        cell.questionLabel.text = question.description
        cell.questionImageView.image = question.image
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Question Item")
    }
}
