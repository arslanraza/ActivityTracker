//
//  LocationsViewModel.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import ATNetwork
import ATLocationCore

class LocationsViewModel {
  
  // MARK: Custom Callback
  typealias LocationsDidLoadCallBack = ([LocationSummary], APIError?) -> Void
  
  // MARK: Properties
  var locations: [LocationSummary] = []
  let apiClient: LocationsService = LocationsAPIClient()
  
  var locationsDidLoadCallBack: LocationsDidLoadCallBack?
  
  func getLocations() {
    apiClient.getLocations { [weak self] result in
      guard let strongSelf = self else { return }
      
      switch result {
      case .success(let locations):
        strongSelf.locationsDidLoadCallBack?(locations, nil)
        
      case.failure(let error):
        strongSelf.locationsDidLoadCallBack?([], error)
      }
    }
  }
  
}
