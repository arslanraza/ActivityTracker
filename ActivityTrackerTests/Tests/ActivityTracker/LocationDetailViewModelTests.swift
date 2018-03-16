//
//  LocationDetailViewModelTests.swift
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

class LocationDetailViewModelTests: QuickSpec {
  
  override func spec() {
    describe("LocationDetailViewModel") {
      
      context("when initialized", {
        let mockAPIClient = MockLocationAPIClient()
        let sut = LocationDetailViewModel(apiClient: mockAPIClient)
        
        context("for success", {
          var exectedLocation: Location?
          sut.getLocationDetail(for: 1, completion: { location, _ in
            exectedLocation = location
          })
          
          it("should return location object", closure: {
            expect(exectedLocation).toNotEventually(beNil())
          })
        })
        
        context("for failure", {
          mockAPIClient.shouldPass = false
          var expectedError: APIError?
          sut.getLocationDetail(for: 1, completion: { _, error in
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
