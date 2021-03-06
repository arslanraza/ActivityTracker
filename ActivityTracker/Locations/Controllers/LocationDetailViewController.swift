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
  
  // MARK: Life Cycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    precondition(location != nil, "Location id should never be nil")
    
    title = location?.displayName
    
    tableView.register(MapTableViewCell.nib, forCellReuseIdentifier: MapTableViewCell.reuseIdentifier)
    tableView.register(ProfileInfoTableViewCell.nib, forCellReuseIdentifier: ProfileInfoTableViewCell.reuseIdentifier)
    tableView.register(ActivityInfoTableViewCell.nib, forCellReuseIdentifier: ActivityInfoTableViewCell.reuseIdentifier)
    tableView.register(TableHeaderFooterView.nib, forHeaderFooterViewReuseIdentifier: TableHeaderFooterView.reuseIdentifier)
    
    tableView.estimatedRowHeight = 200
    tableView.estimatedSectionHeaderHeight = 100
    
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

// MARK: TableViewDataSource
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
      let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.reuseIdentifier) as! MapTableViewCell
      cell.configure(with: location!)
      return cell
      
    case .topRunners:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.reuseIdentifier) as! ProfileInfoTableViewCell
      cell.configure(with: (location?.profiles[indexPath.row])!)
      return cell
      
    case .recentActivity:
      let cell = tableView.dequeueReusableCell(withIdentifier: ActivityInfoTableViewCell.reuseIdentifier) as! ActivityInfoTableViewCell
      let activity = (location?.recentActivities[indexPath.row])!
      cell.configure(with: activity, location: location!)
      return cell
    }
  }
}

// MARK: TableViewDataDelegate
extension LocationDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch Section(rawValue: section)! {
    case .topRunners where topRunners.count > 0:
      let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeaderFooterView.reuseIdentifier) as! TableHeaderFooterView
      view.titleLabel.text = "Top Runners"
      return view
      
    case .recentActivity where recentActivities.count > 0:
      let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeaderFooterView.reuseIdentifier) as! TableHeaderFooterView
      view.titleLabel.text = "Recent Activity"
      return view
      
    default:
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableView.automaticDimension
  }
}
