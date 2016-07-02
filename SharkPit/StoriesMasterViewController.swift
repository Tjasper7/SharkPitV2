//
//  StoriesMasterViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import AVFoundation

class StoriesMasterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var stories = Story.allStories()
    var storyData: NSMutableArray!
    var databaseManager: DatabaseManager?

    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyCollectionView.backgroundColor = .clear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getStoryData()
    }
    
    func getStoryData() {
        storyData = NSMutableArray()
        storyData = DatabaseManager.getInstance().getAllStoryData()
        storyCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let story = storyData.object(at: (indexPath as NSIndexPath).row) as! Story
//        cell.storyImageView.image = story?.storyImage
        cell.storyTitleLabel.text = story.storyTitle
        cell.storyDescriptionLabel.text = story.storyDescription
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Pressed Cell")
    }
}
