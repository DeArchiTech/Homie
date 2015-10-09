//
//  CommunityViewController.swift
//  Homie
//
//  Created by davix on 10/7/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import UIKit
import MapKit

class CommunityViewController: UIViewController {
    
    var backEndManager : BackEndProtocol = MockBackEndManager()

    @IBOutlet var mapViewOutlet: MKMapView!
    
    @IBAction func DinningButtonPressed(sender: AnyObject) {
        print("dinning button pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}