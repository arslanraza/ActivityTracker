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
  let apiClient: LocationsService
  
  // MARK: Initializers
  public init(apiClient: LocationsService) {
    self.apiClient = apiClient
  }
  
  convenience public init() {
    self.init(apiClient: LocationsAPIClient())
  }
  
  // MARK: Public Methods
  
  /// Fetchs Location detail object for a given location
  ///
  /// - Parameters:
  ///   - locationID: (Int value) To get detail for a specific location
  ///   - completion: Completion block with 2 optional parameters. Location and APIError
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
