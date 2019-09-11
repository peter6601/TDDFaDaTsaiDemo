//
//  FaTsaiViewModelTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-09-10.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class FaTsaiViewModelTests: XCTestCase {

    struct Dummy {
        func dummmyBrain() -> FaTsaiBrain {
            let brain = FaTsaiBrain(totalNumbersCount: 3, numbersRange: (1, 3))
            return brain
        }
    }

    var viewModel: FaTsaiViewModel!

    override func setUp() {
        super.setUp()
        viewModel = FaTsaiViewModel(faTsaiBrain: Dummy().dummmyBrain())
    }

    func testViewModelRandomNumbersString() {
        XCTAssertEqual(viewModel.randomNumbersString, "1, 2, 3")
    }
}
