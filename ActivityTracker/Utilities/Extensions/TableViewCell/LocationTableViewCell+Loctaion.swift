//
//  LocationTableViewCell+Loctaion.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import ATLocationCore
import MapKit

extension LocationTableViewCell {
  
  func configure(with locationSummary: LocationSummary, indexPath: IndexPath) {
    titleLabel.text = locationSummary.displayName
    mapView.layer.cornerRadius = 8
    
    guard let lat = Double(locationSummary.lat),
      let lon = Double(locationSummary.lan) else {
        return
    }
    
    // Center map to the location coordinates
    let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500);
    mapView.setRegion(region, animated: true)
    
    // Adding a pin on the coordinate points
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    mapView.addAnnotation(annotation)
    
    // Setting the tag in order to retrive the cell index
    actionButton.tag = indexPath.row
    
  }
  
}
