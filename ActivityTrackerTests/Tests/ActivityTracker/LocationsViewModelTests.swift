//
//  LocationsViewModelTests.swift
//  ActivityTrackerTests
//
//  Created by Arslan Raza on 16/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ActivityTracker
@testable import ATNetwork
@testable import ATLocationCore

class MockLocationAPIClient: LocationsService {
  
  var shouldPass = true
  
  private var locations: [LocationSummary] {
    return (1...10).map({ return  LocationSummary(id: $0, displayName: "NSW - \($0)", lat: "1.23", lan: "-33.123123") })
  }
  
  func getLocations(completion: @escaping (Result<[LocationSummary], APIError>) -> Void) {
    
    let result = shouldPass ? Result<[LocationSummary], APIError>.success(locations) : Result<[LocationSummary], APIError>.failure(APIError.responseUnsuccessful)
    completion(result)
  }
  
  func getLocationDetail(locationID: Int, completion: @escaping (Result<Location, APIError>) -> Void) {
    
  }
  
  
}

class LocationsViewModelTests: QuickSpec {
  override func spec() {
    describe("LocationsViewModel") {
      
      context("when initialized", {
        let mockAPIClient = MockLocationAPIClient()
        let sut = LocationsViewModel(apiClient: mockAPIClient)
        
        context("for success", {
          var expectedLocations: [LocationSummary] = []
          sut.getLocations(completion: { locations, _ in
            expectedLocations = locations
          })
          
          it("should return locations", closure: {
            expect(expectedLocations.count).toEventually(equal(10))
          })
        })
        
        context("for failure", {
          mockAPIClient.shouldPass = false
          var expectedError: APIError?
          sut.getLocations(completion: { _, error in
            expectedError = error
          })
          
          it("should return error", closure: {
            expect(expectedError!).toEventually(equal(APIError.responseUnsuccessful))
          })
        })
        
        
      })
    }
  }
}
