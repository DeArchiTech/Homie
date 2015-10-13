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

class CommunityViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var backEndManager : BackEndProtocol = MockBackEndManager()
    
    let locationManager = CLLocationManager()

    @IBOutlet var mapViewOutlet: MKMapView!
    
    @IBOutlet var searchBarOutlet: UISearchBar!
    
    @IBAction func DinningButtonPressed(sender: AnyObject) {
        print("dinning button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapViewOutlet.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude , longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
        self.mapViewOutlet.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        
        print("Errors " + error.localizedDescription)
        
    }

}