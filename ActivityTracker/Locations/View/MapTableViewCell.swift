//
//  MapTableViewCell.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
  
  @IBOutlet weak var mapView: MKMapView!
  override func awakeFromNib() {
    super.awakeFromNib()
    mapView.layer.cornerRadius = 8
  }
}
