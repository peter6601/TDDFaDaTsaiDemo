//
//  FaTsaiViewModel.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-09-10.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

struct ResultWrapper {
    var resultText: String
    var alertMessage: (title: String, message: String)
}

final class FaTsaiViewModel {    

    let faTsaiBrain: FaTsaiBrain

    private let api: FaDaTsaiAPIProtocol
    private let requests: Requests

    var randomNumbersString: String {
        currentNumbers = faTsaiBrain.randomNumbers().toStringWithComma
        return currentNumbers
    }

    private var currentNumbers: String = ""

    private var task: URLSessionTask?

    init(faTsaiBrain: FaTsaiBrain, api: FaDaTsaiAPIProtocol = FaDaTsaiAPI(), requests: Requests = APIRequests.request) {
        self.faTsaiBrain = faTsaiBrain
        self.api = api
        self.requests = requests
    }

    deinit {
        task?.cancel()
    }

    func resultButtonTapped(completion: @escaping (Result<ResultWrapper, Error>) -> Void) {
        task = api.getResult(request: requests) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let faDaTsai):
                let resultNumbers = faDaTsai.result.toStringWithComma

                let alertMessage: (title: String, message: String) = {
                    if strongSelf.currentNumbers == resultNumbers {
                        return ("恭喜", "發大財了")
                    }
                    return ("可惜", "離發大財只差一小步")
                }()

                completion(.success(ResultWrapper(resultText: resultNumbers, alertMessage: alertMessage)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
