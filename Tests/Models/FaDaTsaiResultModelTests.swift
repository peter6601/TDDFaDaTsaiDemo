//
//  FaDaTsaiResultModelTests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-08-25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class FaDaTsaiResultModelTests: XCTestCase {

    func testValidJSON() {
        let path = Bundle(for: type(of: self)).path(forResource: "FaDaTsaiResult", ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let faDaTsai: FaDaTsaiResult = try! JSONDecoder().decode(FaDaTsaiResult.self, from: jsonData)

        XCTAssertEqual(faDaTsai.result.count, 3)
        XCTAssertEqual(faDaTsai.result, [1, 2, 3])
    }

    func testInvalidJSON() {
        let path = Bundle(for: type(of: self)).path(forResource: "FaDaTsaiInvalidResult", ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))

        do {
            let _ = try JSONDecoder().decode(FaDaTsaiResult.self, from: jsonData)
            XCTFail("This should fail")
        } catch {

        }
    }

}
