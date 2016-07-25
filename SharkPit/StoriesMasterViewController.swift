//
//  StoriesMasterViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import AVFoundation

class StoriesMasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var stories = [Story]()
    var storyData: NSMutableArray!
    var databaseManager: DatabaseManager?
    var refreshControl: UIRefreshControl = UIRefreshControl()

    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getStoryData()
        refreshControl.tintColor = UIColor.white()
        refreshControl.addTarget(self, action: #selector(StoriesMasterViewController.refreshControlAction), for: .valueChanged)
        self.storyCollectionView.addSubview(refreshControl)
        storyCollectionView.backgroundColor = .clear()
        if storyData == 0 {
            noStoriesLabel()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.getStoryData()
    }
    
    func getStoryData() {
        storyData = NSMutableArray()
        storyData = DatabaseManager.getInstance().getAllStoryData()
        storyCollectionView.reloadData()
    }
    
    func noStoriesLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 286)
        label.textAlignment = NSTextAlignment.center
        label.text = "No Stories Yet"
        self.view.addSubview(label)
    }
    
    func refreshControlAction() {
        self.getStoryData()
        refreshControl.endRefreshing()
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let story = storyData.object(at: (indexPath as NSIndexPath).row) as! Story
        cell.storyTitleLabel.text = story.storyTitle
//        cell.storyDescriptionLabel.text = story.storyDescription
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Pressed Cell")
    }
}
