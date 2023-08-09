//
//  EarthquakeLocationViewController.swift
//  Earthquake App
//
//  Created by Ilyas on 5.08.2023.
//

import UIKit
import MapKit

class EarthquakeLocationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var coordinates: [Double]?
    var locationName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let latitude = coordinates?.last, let longitude = coordinates?.first {
            setMapSettings(latitude: latitude, longitude: longitude)
        }
        
        navigationItem.title = locationName
    }
    
    
    func setMapSettings(latitude: Double, longitude: Double) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        
        pin.coordinate = location
        
        mapView.addAnnotation(pin)
    }
    

}
