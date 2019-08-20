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
   
    let faTsaiLa = FaTsaiBrain([1,2,3,4,5,6])

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCountIsSix() {
        XCTAssert(faTsaiLa.checkCount(6))
        
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
