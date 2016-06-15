//
//  PoolHallMainViewController.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class PoolHallMainViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MKUserTrackingMode.follow
    }
}
