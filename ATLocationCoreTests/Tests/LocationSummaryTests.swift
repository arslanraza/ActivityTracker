//
//  LocationSummaryTests.swift
//  ATLocationCoreTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ATLocationCore

class LocationSummaryTests: QuickSpec {
  override func spec() {
    describe("LocationSummary") {
      
      context("after loading from a json", {
        
        let url = Bundle(for: type(of: self)).url(forResource: "locations", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        it("should have data", closure: {
          expect(data).to(beNil())
        })
        
        it("should be properly serialized", closure: {
          let decoder = JSONDecoder()
          let locations = try? decoder.decode([LocationSummary].self, from: data!)
          
          expect(locations?.count).to(equal(5))
          
        })
      })
    }
  }
}
