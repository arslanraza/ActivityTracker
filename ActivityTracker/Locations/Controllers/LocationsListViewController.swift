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
  
  // MARK: Life Cycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(LocationTableViewCell.nib, forCellReuseIdentifier: LocationTableViewCell.reuseIdentifier)
    tableView.estimatedRowHeight = 110
    
    viewModel.locationsDidLoadCallBack = { [weak self] locations, error in
      guard let strongSelf = self,
        error == nil else {
          // Display Error message
          return
      }
      
      DispatchQueue.main.async {
        strongSelf.locations = locations
        strongSelf.tableView.reloadData()
      }      
    }
    
    viewModel.getLocations()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension LocationsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier) as! LocationTableViewCell
    cell.configure(with: locations[indexPath.row])
    return cell
  }
}

extension LocationsListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
