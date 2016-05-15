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
        //run the defined function with the location specified at the top as the map center
        centerMapOnLocation(initialLocation)
       
        //set delegate to self
        
        mapView.delegate = self
        
        // show artwork on map
        let car = Car(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        
        mapView.addAnnotation(car)
        
        
        
        
    }

// MARK: - location manager to authorize user location for Maps app
        var locationManager = CLLocationManager()
        func checkLocationAuthorizationStatus() {
            if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
                mapView.showsUserLocation = true
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }

        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            checkLocationAuthorizationStatus()
        }
    
    
}
