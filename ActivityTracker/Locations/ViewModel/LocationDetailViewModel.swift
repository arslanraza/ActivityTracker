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
  typealias LocationDetailFinishedLoadingCallBack = (Location?, APIError?) -> Void
  
  // MARK: Properties
  let apiClient: LocationsService = LocationsAPIClient()
  
  var locationDetailFinishedLoading: LocationDetailFinishedLoadingCallBack?
  
  func getLocationDetail(for locationID: Int) {
    apiClient.getLocationDetail(locationID: locationID) { [weak self] result in
      guard let strongSelf = self else { return }
      
      switch result {
      case .success(let location):
        strongSelf.locationDetailFinishedLoading?(location, nil)
        
      case.failure(let error):
        strongSelf.locationDetailFinishedLoading?(nil, error)
      }
    }
  }
  
}
