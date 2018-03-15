//
//  APIErrorTests.swift
//  ATNetworkTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ATNetwork

class APIErrorTests: QuickSpec {
  override func spec() {
    describe("APIError") {
      context("when initialized", {
        let sutFailed = APIError.failed
        let sutInvalidData = APIError.invalidData
        let sutJSONConversionFailed = APIError.jsonConversionFailed
        let sutJSONParsingFailure = APIError.jsonParsingFailure
        let sutResponseUnsuccessful = APIError.responseUnsuccessful
        it("should have proper states", closure: {
          expect(sutFailed.localizedDescription).to(equal(APIError.failed.localizedDescription))
          expect(sutInvalidData.localizedDescription).to(equal(APIError.invalidData.localizedDescription))
          expect(sutJSONConversionFailed.localizedDescription).to(equal(APIError.jsonConversionFailed.localizedDescription))
          expect(sutJSONParsingFailure.localizedDescription).to(equal(APIError.jsonParsingFailure.localizedDescription))
          expect(sutResponseUnsuccessful.localizedDescription).to(equal(APIError.responseUnsuccessful.localizedDescription))
        })
      })
    }
  }
}
