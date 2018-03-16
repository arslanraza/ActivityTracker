//
//  MockLocationAPIClient.swift
//  ActivityTrackerTests
//
//  Created by Arslan Raza on 16/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
@testable import ATNetwork
@testable import ATLocationCore

class MockLocationAPIClient: LocationsService {
  
  var shouldPass = true
  
  private var locations: [LocationSummary] {
    return (1...10).map({ return  LocationSummary(id: $0, displayName: "NSW - \($0)", lat: "1.23", lan: "-33.123123") })
  }
  
  private var location: Location {
    return Location.init(locations.first!)
  }
  
  func getLocations(completion: @escaping (Result<[LocationSummary], APIError>) -> Void) {
    
    let result = shouldPass ? Result<[LocationSummary], APIError>.success(locations) : Result<[LocationSummary], APIError>.failure(APIError.responseUnsuccessful)
    completion(result)
  }
  
  func getLocationDetail(locationID: Int, completion: @escaping (Result<Location, APIError>) -> Void) {
    let result = shouldPass ? Result<Location, APIError>.success(location) : Result<Location, APIError>.failure(APIError.responseUnsuccessful)
    completion(result)
  }
  
  
}
