//
//  MapViewController.swift
//  ExchangeAGram
//
//  Created by Carl Sharman on 02/02/2015.
//  Copyright (c) 2015 United Learning. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Fetch FeedItems from core data
        let request = NSFetchRequest(entityName: "FeedItem")
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        var error: NSError?
        let itemArray = context.executeFetchRequest(request, error: &error)
        
        println(error)
        
        if itemArray!.count > 0 {
            
            for item in itemArray! {
                // Define map region to show
                let location = CLLocationCoordinate2D(latitude: Double(item.latitude), longitude: Double(item.longitude))
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegionMake(location, span)
                self.mapView.setRegion(region, animated: true)
                
                // Create and add an annotation for our location
                let annotation = MKPointAnnotation()
                annotation.setCoordinate(location)
                annotation.title = item.caption
                mapView.addAnnotation(annotation)
            }		
        }
        
        /*
        // Define the map region to show
        let location = CLLocationCoordinate2D(latitude: 48.868639224587, longitude: 2.37119161036255)  // Paris
        let span = MKCoordinateSpanMake(0.05, 0.05)  // Amount of area spanned by the map
        let region = MKCoordinateRegionMake(location, span)  // Portion of the map to display (location is centre, span is area)
        self.mapView.setRegion(region, animated: true)
        
        // Create and add an annotation to our location
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Canal Saint-Martin"
        annotation.subtitle = "Paris"
        self.mapView.addAnnotation(annotation)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
