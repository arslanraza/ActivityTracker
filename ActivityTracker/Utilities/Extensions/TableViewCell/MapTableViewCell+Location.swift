//
//  MapTableViewCell+Location.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import ATLocationCore
import MapKit

extension MapTableViewCell {
  
  func configure(with location: Location) {
    
    guard let lat = Double(location.lat),
      let lon = Double(location.lan) else {
        return
    }
    
    // Center map to the location coordinates
    let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 800, longitudinalMeters: 800);
    mapView.setRegion(region, animated: true)
    
    // Adding a pin on the coordinate points
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    mapView.addAnnotation(annotation)
    
  }
  
}
