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
        guard requiredNumbersInRange() else {
            return []
        }
        var result = Set<Int>()
        while result.count < totalNumbersCount {
            let randomInt = Int.random(in: numbersRange.first...numbersRange.last)
                result.insert(randomInt)
        }
        return Array(result).sorted()
    }
}

extension FaTsaiBrain {

    private func requiredNumbersInRange() -> Bool {
        return numbersRange.last - numbersRange.first + 1 >= totalNumbersCount
    }

}
