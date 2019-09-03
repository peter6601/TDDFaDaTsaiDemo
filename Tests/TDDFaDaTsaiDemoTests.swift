//
//  TDDFaDaTsaiDemoTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by DinDin on 2019/8/20.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class TDDFaDaTsaiDemoTests: XCTestCase {
    let list = [2,6,29,31,36,37]
    let faTsaiLa = FaTsaiBrain(selectNumbersCount: 6, containNumbers: [6,31], unContainNumbers: [1,4], continuitysNumbers: 1, numbersRange: (1,38))

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumbersCountIsSix() {
        XCTAssertTrue(faTsaiLa.checkNumbersCount(6, list: list))
        
    }
    
    func testNumbersRange() {
        XCTAssertTrue(faTsaiLa.checkNumbersRange(first: 1, last: 38, list: list))
    }
    
    
    func testNumbersNotContainSpecificNumbers() {
        XCTAssertTrue(faTsaiLa.checkNumbersNotsContainNumbers([1,4], list: list))

    }
    
    func testNumbersContainSpecificNumbers() {
        XCTAssertTrue(faTsaiLa.checkNumbersContainNumbers([6,31], list: list))

    }
    
    func testNumbersAreContinuity() {
        XCTAssertTrue(faTsaiLa.checkNumbersAreContinuitys(1, list: list))
    }


}
