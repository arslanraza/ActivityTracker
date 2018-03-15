//
//  LocationsListViewControllerTests.swift
//  ActivityTrackerTests
//
//  Created by Arslan Raza on 15/3/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ActivityTracker

class LocationsListViewControllerTests: QuickSpec {
  override func spec() {
    describe("LocationsList controller") {
      
      context("when displayed", {
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationsListViewController") as! LocationsListViewController
        let _ = sut.view
        it("should have a tableView", closure: {
          expect(sut.tableView).notTo(beNil())
        })
      })
    }
  }
}
