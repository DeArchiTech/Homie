//
//  CommunityViewController.swift
//  Homie
//
//  Created by davix on 10/7/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Parse

class HomeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var backEndManager : BackEndProtocol = MockBackEndManager()
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        let user = PFUser()
        user.username = "davix1013"
        user.password = "davix1013"
        user.email = "davidkwokhochan@gmail.com"
        
        // other fields can be set if you want to save more information
        user["phone"] = "415-960-5816"
        
        user.signUpInBackgroundWithBlock{ (success, error) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
                // Examine the error object and inform the user.
            }
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude , longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        
        print("Errors " + error.localizedDescription)
        
    }

}