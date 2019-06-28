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
            expect(expectedError!).toEventually(equal(APIError.responseUnsuccessful), timeout: 5.0)
          })
        })
        
      })
    }
  }
}
