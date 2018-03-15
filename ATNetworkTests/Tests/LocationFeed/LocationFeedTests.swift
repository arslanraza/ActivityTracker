//
//  LocationFeedTests.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ATNetwork

//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/locations.json
//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/location/<location id>.json
//https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/<img url>

class LocationFeedTests: QuickSpec {
  override func spec() {
    describe("LocationFeed") {
      
      context("when created for locations", {
        let sutLocations = LocationFeed.locations
        
        it("should have correct url path", closure: {
          let expectedURL = "https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/locations.json"
          expect(sutLocations.request.url?.absoluteString).to(equal(expectedURL))
        })
      })
      
      context("when created for location detail", {
        let sutLocations = LocationFeed.locationDetail(id: 1)
        
        it("should have correct url path", closure: {
          let expectedURL = "https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/location/1.json"
          expect(sutLocations.request.url?.absoluteString).to(equal(expectedURL))
        })
      })
      
      context("when created for image", {
        let imagePath = "test-image.jpg"
        let sutLocations = LocationFeed.image(path: imagePath)
        
        it("should have correct url path", closure: {
          
          let expectedURL = "https://s3-ap-southeast-2.amazonaws.com/ios-code-test/v2/\(imagePath)"
          expect(sutLocations.request.url?.absoluteString).to(equal(expectedURL))
        })
      })
      
      
    }
  }
}
