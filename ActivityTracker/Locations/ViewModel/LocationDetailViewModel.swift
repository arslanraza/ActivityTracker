//
//  LocationDetailViewModel.swift
//  ActivityTracker
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

import ATNetwork
import ATLocationCore

class LocationDetailViewModel {
  
  // MARK: Custom Callback
  typealias LocationDetailCompletionBlock = (Location?, APIError?) -> Void
  
  // MARK: Properties
  let apiClient: LocationsService = LocationsAPIClient()
  
  func getLocationDetail(for locationID: Int, completion: LocationDetailCompletionBlock?) {
    apiClient.getLocationDetail(locationID: locationID) { result in
      switch result {
      case .success(let location):
        completion?(location, nil)
      case.failure(let error):
        completion?(nil, error)
      }
    }
  }
  
}
