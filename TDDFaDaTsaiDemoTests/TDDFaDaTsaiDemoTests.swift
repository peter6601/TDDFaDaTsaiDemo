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

    let faTsaiLa = FaTsaiBrain([2,6,29,31,36,37])

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumbersCountIsSix() {
        XCTAssertTrue(faTsaiLa.checkNumbersCount(6))
        
    }
    
    func testNumbersRange() {
        XCTAssertTrue(faTsaiLa.checkNumbersRange(first: 1, last: 38))
    }
    
    func testNumbersAreOdd() {
        XCTAssertTrue(!faTsaiLa.checkNumbersAreOdd())
    }
    
    func testNumbersAreEven() {
        XCTAssertTrue(!faTsaiLa.checkNumbersAreEven())

    }
    
    func testNumbersNotContainSpecificNumbers() {
        XCTAssertTrue(faTsaiLa.checkNumbersNotsContainSpecificNumbers([4,13]))

    }
    
    func testNumbersContainSpecificNumbers() {
        XCTAssertTrue(faTsaiLa.checkNumbersContainSpecificNumbers([2,31]))

    }
    
    func testNumbersAreContinuity() {
        XCTAssertTrue(faTsaiLa.checkNumbersAreContinuitys(2))
    }


}
