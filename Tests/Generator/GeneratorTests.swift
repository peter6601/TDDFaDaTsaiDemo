//
//  GeneratorTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-08-22.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class GeneratorTests: XCTestCase {

    private let generator = Generator()

    func testRandomNumbersCount() {
        XCTAssertEqual(generator.randomNumbers(between: 1, 5, totalNumbersNeeded: 2).count, 2)
    }

    func testRangeIsSmallerThanTotalNumber() {
        XCTAssertEqual(generator.randomNumbers(between: 1, 2, totalNumbersNeeded: 3).count, 0)

    }

    func testRangeIsEqualToTotalNumbers() {
        XCTAssertEqual(generator.randomNumbers(between: 1, 3, totalNumbersNeeded: 3).count, 3)
    }

    func testFirstNumberIsSmallerThanSecondNumber() {
        let numbers = generator.randomNumbers(between: 1, 10, totalNumbersNeeded: 3)
        XCTAssertTrue(numbers[0] < numbers[1])
    }

    func testLastElementIsTheLargestNumber() {
        let numbers = generator.randomNumbers(between: 1, 5, totalNumbersNeeded: 3)
        XCTAssertTrue(numbers.last! > numbers[0] && numbers.last! > numbers[1])
    }

}
