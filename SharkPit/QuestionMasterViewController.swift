
//
//  ViewController.swift
//  Shark Pit
//
//  Created by Tyler Jasper on 4/17/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionMasterViewController: UICollectionViewController  {
    
    private var questionsDataSource = QuestionsDataSource()
    var question : Question?
    let detailViewControllerId = "MasterToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutCellWidth()
    }
    
    //MARK: Actions
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
            
    }
    
    //MARK: Segues from CreateQuestion 
    @IBAction func createQuestionCancelButtonTapped(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func createQuestionSaveButtonTapped(segue: UIStoryboardSegue) {
        
        // Add question to collectionView
        let indexPath = questionsDataSource.indexPathForNewQuestion()
        collectionView?.insertItems(at: [indexPath as IndexPath])
    }
    
    // MARK: Segue to QuestionDetail
    
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == detailViewControllerId {
            let detailVC = segue.destinationViewController as! QuestionDetailViewController
            detailVC.question = sender as? Question
        }
    }
    
    // Layout
    func layoutCellWidth() {
        let width = collectionView!.frame.width / 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    // MARK: UICollectionViewDataSource
     override func numberOfSections(in collectionView: UICollectionView?) -> Int {
        return questionsDataSource.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsDataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath as NSIndexPath as IndexPath) as! QuestionCell
        if let question = questionsDataSource.questionForItemAtIndexPath(indexPath: indexPath as NSIndexPath) {
            cell.question = question
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        if let question = questionsDataSource.questionForItemAtIndexPath(indexPath: indexPath as NSIndexPath) {
            performSegue(withIdentifier: detailViewControllerId, sender: question)
        }
    }
}