//
//  ArrayExtensionTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-08-22.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest

class ArrayExtensionTests: XCTestCase {

    func testConvertToStringWithComma() {
        let array = [1, 2]
        XCTAssertEqual(array.toStringWithComma, "1, 2")
    }

}
