//
//  LocationDetailViewController.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import ATLocationCore

class LocationDetailViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: properties
  fileprivate enum Section: Int {
    case map, topRunners, recentActivity
    static let count = 3
  }
  
  var locationID: Int?
  var location: Location?
  fileprivate let viewModel = LocationDetailViewModel()
  
  fileprivate var topRunners: [Profile] {
    return location?.profiles ?? []
  }
  
  fileprivate var recentActivities: [Activity] {
    return location?.recentActivities ?? []
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    precondition(locationID != nil, "Location id should never be nil")
    
    viewModel.getLocationDetail(for: locationID!) { [weak self] location, error in
      guard let strongSelf = self,
        error == nil else {
        return
      }
      
      DispatchQueue.main.async {
        strongSelf.location = location
        strongSelf.tableView.reloadData()
      }
    }
  }
  
}

extension LocationDetailViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch Section(rawValue: section)! {
    case .map:
      return 1
    case .topRunners:
      return topRunners.count
    case .recentActivity:
      return recentActivities.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch Section(rawValue: indexPath.section)! {
    case .map:
      break
    case .topRunners:
      break
    case .recentActivity:
      break
    }
    
    return UITableViewCell()
  }
}

extension LocationDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}
