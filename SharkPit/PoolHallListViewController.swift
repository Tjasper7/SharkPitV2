//
//  PoolHallListViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 7/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class PoolHallListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet var poolhallTableView: UITableView!
    
    var businesses: [NSDictionary] = []
    var query = "PoolHalls"
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poolhallTableView.delegate = self
        poolhallTableView.dataSource = self
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessListingCell") as! BusinessListingTableViewCell
//        var business = businesses[(indexPath as NSIndexPath).row]
//        
//        var thumbnailImageUrl = business["image_url"] as! String
//        cell.thumbnailImageView.
//        cell.thumbnailImageView.setImageWith(URL(string: thumbnailImageUrl))
//        
//        var ratingImageUrl = business["rating_img_url_large"] as! String
//        cell.starRatingImageView.setImageWith(URL(string: ratingImageUrl))
//        
//        cell.businessNameLabel.text = business["name"] as? String
//        
//        var reviewCount = business["review_count"] as! Int
//        cell.reviewCountLabel.text = "\(reviewCount) reviews"
//        
//        var location = business["location"] as! NSDictionary
//        var addressParts = location["address"] as! [String]
//        var address = " ".join(addressParts)
//        var city = location["city"] as! String
//        cell.addressLabel.text = "\(address), \(city)"
//        
//        var categories = business["categories"] as! [NSArray]
//        
//        var categoriesLabels: [String] = categories.reduce([]) {
//            var currentValue = $0 as [String]
//            var category = $1 as! [String]
//            var label = category[0]
//            currentValue.append(label)
//            return currentValue
//        }
//        
//        cell.categoryLabel.text = ", ".join(categoriesLabels)
//        
//        // Additional data used for segue...
//        cell.businessId = business["id"] as! String
        
        return cell
    }
}
