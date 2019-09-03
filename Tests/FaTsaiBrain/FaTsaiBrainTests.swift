//
//  FaTsaiBrainTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-09-04.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class FaTsaiBrainTests: XCTestCase {

    var faTsaiBrain = FaTsaiBrain(totalNumbersCount: 3, numbersRange: (1, 10))

    func testInclusiveNumbers() {
        faTsaiBrain.inclusiveNumbers = [2]
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(2))
    }

    func testRequiredNumbersNotInRange() {
        faTsaiBrain.numbersRange = (1, 5)
        faTsaiBrain.totalNumbersCount = 6
        XCTAssertTrue(faTsaiBrain.randomNumbers().isEmpty)
    }

    func testConsecutiveNumbers() {
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 2, start: 3)
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(3))
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(4))
    }

}
