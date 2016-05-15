//
//  ViewController.swift
//  Dude Wheres My Car
//
//  Created by Allen Spicer on 5/15/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set map center Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        //define a distance to be applied below
        let regionRadius: CLLocationDistance = 1000
        //define a function called centermap on location which takes a location...
        func centerMapOnLocation(location: CLLocation) {
            //...and creates a coordinate region by applying the above distance to an east-west radius and north-south
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius * 2.0,
                                                                      regionRadius * 2.0)
            //display the region
            mapView.setRegion(coordinateRegion, animated: true)
            }

    }



}

