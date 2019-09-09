//
//  FaTsaiBrain.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

final class FaTsaiBrain {

    var totalNumbersCount: Int

    var numbersRange: (first: Int, last: Int)

    init(totalNumbersCount: Int, numbersRange: (first: Int, last: Int)) {
        self.totalNumbersCount = totalNumbersCount
        self.numbersRange = numbersRange
    }

    func randomNumbers() -> [Int] {
        return []
    }
}
