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
            let brain = FaTsaiBrain(totalNumbersCount: 6, numbersRange: (1, 6))
            return brain
        }
    }

    struct DummyService: Service {
        func get(request: Requests = DummyRequests.request, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask? {
            completion(.success(Data()))

            return nil
        }
    }

    enum DummyRequests: String, Requests {
        case request = "https://iplayground.io"

        var url: URL {
            return URL(string: rawValue)!
        }
    }

    struct DummyAPI: FaDaTsaiAPIProtocol {
        var service: Service = DummyService()
        func getResult(request: Requests, completion: @escaping (Result<FaDaTsaiResult, Error>) -> Void) -> URLSessionTask? {
            completion(.success(FaDaTsaiResult(result: [22, 23, 24])))

            return nil
        }
    }

    var viewModel: FaTsaiViewModel!

    override func setUp() {
        super.setUp()
        viewModel = FaTsaiViewModel(faTsaiBrain: Dummy().dummmyBrain(), api: DummyAPI(), requests: DummyRequests.request)
    }

    func testViewModelRandomNumbersString() {
        XCTAssertEqual(viewModel.randomNumbersString, "1, 2, 3, 4, 5, 6")
    }

    func testResultButtonTapped() {
        viewModel.resultButtonTapped { result in
            switch result {
            case .success(let wrapper):
                XCTAssertEqual(wrapper.resultText, "22, 23, 24")
                XCTAssertEqual(wrapper.alertMessage.title, "可惜")
                XCTAssertEqual(wrapper.alertMessage.message, "離發大財只差一小步")
            case .failure:
                XCTFail("This endpoint should success")
            }
        }
    }
}
