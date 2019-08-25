//
//  FaDaTsaiAPITests.swift
//  TDDFaDaTsaiDemoTests
//
//  Created by Steve Sun on 2019-08-25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import XCTest
@testable import TDDFaDaTsaiDemo

class FaDaTsaiAPITests: XCTestCase {

    func testAPIRequestsURL() {
        let urlComponents = URLComponents(url: APIRequests.request.url, resolvingAgainstBaseURL: false)
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.path, "/SteveS0911/ade1c7d1033cf74446b8200e1ffd7da3/raw/b366f21d0fcf2af667338c83cdbdf91686ec91b9/FaDaTsaiAPP.json")

    }

}
