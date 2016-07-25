//
//  PoolhallDetailViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 7/20/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import MapKit

class PoolHallDetailViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    }
}
