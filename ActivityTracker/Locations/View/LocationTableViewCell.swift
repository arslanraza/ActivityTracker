//
//  LocationTableViewCell.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import MapKit

class LocationTableViewCell: UITableViewCell {
  
  // MARK: Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var actionButton: UIButton!
  
  // MARK: LifeCycle Methods
  override func awakeFromNib() {
    super.awakeFromNib()
    mapView.layer.cornerRadius = 8
  }
}
