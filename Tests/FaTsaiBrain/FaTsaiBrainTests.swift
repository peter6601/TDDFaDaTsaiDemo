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

    func testRequiredNumbersnInRange() {
        XCTAssertTrue(faTsaiBrain.randomNumbers().last! < 11)
        XCTAssertTrue(faTsaiBrain.randomNumbers().first! > 0)
    }

    func testRequiredNumbersNotInRange() {
        faTsaiBrain.numbersRange = (1, 5)
        faTsaiBrain.totalNumbersCount = 6
        XCTAssertTrue(faTsaiBrain.randomNumbers().isEmpty)
    }

    func testInclusiveNumbers() {
        faTsaiBrain.inclusiveNumbers = [2]
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(2))
    }

    func testInclusiveNumbersOutOfUpperRange() {
        faTsaiBrain.inclusiveNumbers = [12]
        XCTAssertTrue(faTsaiBrain.randomNumbers().isEmpty)
    }

    func testInclusiveNumbersOutOfLowerRange() {
        faTsaiBrain.inclusiveNumbers = [0]
        XCTAssertTrue(faTsaiBrain.randomNumbers().isEmpty)
    }

    func testExclusiveNumbers() {
        faTsaiBrain.exclusiveNumbers = [3]
        XCTAssertTrue(!faTsaiBrain.randomNumbers().contains(3))
    }

    func testExclusiveNumbersOutOfRange() {
        faTsaiBrain.exclusiveNumbers = [13]
        XCTAssertTrue(faTsaiBrain.randomNumbers().isEmpty)
    }

    func testExclusiveNumbersContainInclusiveNumbers() {
        faTsaiBrain.inclusiveNumbers = [1, 2]
        faTsaiBrain.exclusiveNumbers = [1, 2]
        XCTAssertEqual(faTsaiBrain.randomNumbers(), [])
    }

    func testConsecutiveNumbers() {
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 2, start: 3)
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(3))
        XCTAssertTrue(faTsaiBrain.randomNumbers().contains(4))
    }

    func testExceedInclusiveNumbersPlusConsecutiveNumbersCount() {
        faTsaiBrain.inclusiveNumbers = [1, 2, 3]
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 5, start: 4)
        XCTAssertEqual(faTsaiBrain.randomNumbers(), [])
    }

    func testConsecutiveNumbersInRange() {
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 2)
        XCTAssert(faTsaiBrain.randomNumbers().last! < 11)
    }

    func testConsecutiveNumbersOutOfRange() {
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 4)
        XCTAssert(faTsaiBrain.randomNumbers().isEmpty)
    }
}
