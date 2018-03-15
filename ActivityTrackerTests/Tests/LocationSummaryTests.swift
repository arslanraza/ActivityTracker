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
          expect(data).notTo(beNil())
        })
        
        context("and when serialized", {
          
          let decoder = JSONDecoder()
          let locations = try? decoder.decode([LocationSummary].self, from: data!)
          
          it("array should not be nil", closure: {
            expect(locations).notTo(beNil())
          })
          
          it("should have 5 elements", closure: {
            expect(locations?.count).to(equal(5))
          })
          
        })
        
       
      })
    }
  }
}
