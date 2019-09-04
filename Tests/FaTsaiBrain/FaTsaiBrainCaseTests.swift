//
//  FaTsaiBrainCaseTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by DinDin on 2019/9/4.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest

class FaTsaiBrainCaseTests: XCTestCase {

    let faTasiList = [2,6,29,31,36,37]
    
    var faTsaiBrain = FaTsaiBrain(totalNumbersCount: 6, numbersRange: (1,38))
    
    func testNumbersCount() {
        XCTAssert(faTsaiBrain.randomNumbers().count == 6)
    }
    
    func testInclusiveNumbers() {
        faTsaiBrain.inclusiveNumbers = [2, 31]
        XCTAssert(faTsaiBrain.randomNumbers().contains(2))
        XCTAssert(faTsaiBrain.randomNumbers().contains(31))
    }
    
    func testExclusiveNumbers() {
        faTsaiBrain.exclusiveNumbers = [4, 13]
        XCTAssert(!faTsaiBrain.randomNumbers().contains(4))
        XCTAssert(!faTsaiBrain.randomNumbers().contains(13))
    }
    
    func testConsecutiveNumbers() {
        faTsaiBrain.consecutiveNumbersInfo = ConsecutiveNumbersInfo(total: 2, start: 36)
        XCTAssert(faTsaiBrain.randomNumbers().contains(36))
        XCTAssert(faTsaiBrain.randomNumbers().contains(37))
    }
    
    

}
