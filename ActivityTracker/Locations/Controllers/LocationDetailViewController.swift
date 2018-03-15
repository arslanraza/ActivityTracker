//
//  LocationDetailViewController.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
  // MARK: Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: properties
  var locationID: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    precondition(locationID != nil, "Location id should never be nil")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
