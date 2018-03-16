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
  typealias LocationsCompletionBlock = ([LocationSummary], APIError?) -> Void
  
  // MARK: Properties
  var locations: [LocationSummary] = []
  let apiClient: LocationsService
  
  // MARK: Initializers
  public init(apiClient: LocationsService) {
    self.apiClient = apiClient
  }
  
  convenience public init() {
    self.init(apiClient: LocationsAPIClient())
  }
  
  
  func getLocations(completion: LocationsCompletionBlock?) {
    apiClient.getLocations { result in
      switch result {
      case .success(let locations):
        completion?(locations, nil)
      case.failure(let error):
        completion?([], error)
      }
    }
  }
  
}
