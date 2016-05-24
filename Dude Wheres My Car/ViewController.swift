//
//  ViewController.swift
//  Dude Wheres My Car
//
//  Created by Allen Spicer on 5/15/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

import UIKit
import MapKit 

class ViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet weak var mapView: MKMapView!

    //location manager
    var locationManager = CLLocationManager()
    var pinDropCoordinate = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        mapView.showsUserLocation = true
        
        

        // set map center
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
        
    }

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
    
@IBAction func markCarWithPin(sender: UIBarButtonItem) {
    
    NSLog(String(mapView.userLocation.location?.coordinate.latitude))
    NSLog(String(mapView.userLocation.location?.coordinate.longitude))
    
    pinDropCoordinate.latitude = mapView.centerCoordinate.latitude
    pinDropCoordinate.longitude = mapView.centerCoordinate.longitude
    
    let car = Car(title: "My Car",
                  locationName: "Parked Location",
                    coordinate: pinDropCoordinate)
    
    mapView.addAnnotation(car)
    
    zoomToUserAndPin()
    
}
    func zoomToUserAndPin(){
        
        locationManager
        
        if (pinDropCoordinate != nil &&  != nil){
            
            self.
        }
    }
    
    
    
@IBAction func deleteAllPins(sender: UIBarButtonItem) {
    let annotationsArray:Array = mapView.annotations
    mapView.removeAnnotations(annotationsArray)
    }

}
