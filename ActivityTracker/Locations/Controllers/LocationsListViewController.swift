//
//  LocationsListViewController.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit

class LocationsListViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Properties
  let viewModel = LocationsViewModel()
  
  // MARK: Life Cycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.locationsDidLoadCallBack = { [weak self] locations, error in
//      guard let strongSelf = self else { return }
//      print("Fetched Locations: \(locations)")
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
