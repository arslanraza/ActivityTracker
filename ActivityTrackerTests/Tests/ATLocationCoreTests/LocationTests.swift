//
//  LocationTests.swift
//  ActivityTrackerTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ATLocationCore

class LocationTests: QuickSpec {
  override func spec() {
    describe("A Location") {
      
      context("after loading from a json", {
        
        let url = Bundle(for: type(of: self)).url(forResource: "location_detail", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        it("should have data", closure: {
          expect(data).notTo(beNil())
        })
        
        context("and when serialized", {

          let decoder = JSONDecoder()
          let sut = try? decoder.decode(Location.self, from: data!)

          it("should not be nil", closure: {
            expect(sut).notTo(beNil())
          })

          it("should have 2 worker ids", closure: {
            expect(sut?.workerIDs.count).to(equal(2))
          })
          
          it("should have 5 recent activities", closure: {
            expect(sut?.recentActivities.count).to(equal(5))
          })
          
          it("should have 4 profiles", closure: {
            expect(sut?.profiles.count).to(equal(4))
          })

        })
        
      })
    }
  }
}
