//
//  ProfileMainViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/7/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class ProfileMainViewController: UICollectionViewController {
    
    let profiles = Profile.allProfileCellsPlist()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let width = collectionView!.bounds.width
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize(width: width, height: 180)
        layout.itemSize = CGSize(width: width, height: 62)
        
    }
}

extension ProfileMainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        cell.profile = profiles[(indexPath as NSIndexPath).item]
        
        return cell
    }
    
}

