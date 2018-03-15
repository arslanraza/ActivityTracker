//
//  LocationsListViewController.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import ATLocationCore

class LocationsListViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Properties
  fileprivate let viewModel = LocationsViewModel()
  fileprivate var locations: [LocationSummary] = []
  fileprivate var selectedLocation: LocationSummary?
  
  fileprivate enum Segue: String {
    case locationDetail
  }
  
  // MARK: Life Cycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TableView Configurations
    tableView.register(LocationTableViewCell.nib, forCellReuseIdentifier: LocationTableViewCell.reuseIdentifier)
    tableView.estimatedRowHeight = 110
    
    refreshUI()    
  }
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Segue.locationDetail.rawValue,
      let locationDetailController = segue.destination as? LocationDetailViewController,
      let _ = selectedLocation {
      locationDetailController.locationID = selectedLocation?.id
      locationDetailController.location = Location.init(selectedLocation!)
    }
  }
  
  // MARK: Private Methods
  
  private func refreshUI() {
    viewModel.getLocations(completion: { [weak self] locations, error in
      guard let strongSelf = self,
        error == nil else {
          // Display Error message
          return
      }
      
      DispatchQueue.main.async {
        strongSelf.locations = locations
        strongSelf.tableView.reloadData()
      }
    })
  }
  
  private func showLocationDetail(for location: LocationSummary) {
    selectedLocation = location
    performSegue(withIdentifier: Segue.locationDetail.rawValue, sender: self)
  }
  
  // MARK: Actions
  @IBAction func tappedLocation(_ sender: UIButton) {
    showLocationDetail(for: locations[sender.tag])
  }
  
}

extension LocationsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier) as! LocationTableViewCell
    cell.configure(with: locations[indexPath.row], indexPath: indexPath)
    return cell
  }
}

extension LocationsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
}
