//
//  LocationsApiClient.swift
//  ATNetwork
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import ATLocationCore

protocol LocationsService {
  func getLocations(completion: @escaping (Result<[LocationSummary], APIError>) -> Void)
  func getLocationDetail(locationID: Int, completion: @escaping (Result<Location, APIError>) -> Void)
}

public class LocationsAPIClient: APIClient, LocationsService {
  let session: URLSessionProtocol
  
  public init(configuration: URLSessionConfiguration) {
    self.session = URLSession(configuration: configuration)
  }
  
  convenience public init() {
    self.init(configuration: .default)
  }
  
  // MARK: Public Methods
  
  func getLocations(completion: @escaping (Result<[LocationSummary], APIError>) -> Void) {
    let endpoint = LocationFeed.locations
    let request = endpoint.request
    
    fetch(with: request, decode: { json -> [LocationSummary]? in
      guard let result = json as? [LocationSummary] else {
        return  nil
      }
      return result
    }, completion: completion)
  }
  
  func getLocationDetail(locationID: Int, completion: @escaping (Result<Location, APIError>) -> Void) {
    let endpoint = LocationFeed.locationDetail(id: locationID)
    let request = endpoint.request
    
    fetch(with: request, decode: { json -> Location? in
      guard let result = json as? Location else {
        return  nil
      }
      return result
    }, completion: completion)
  }
  
}
