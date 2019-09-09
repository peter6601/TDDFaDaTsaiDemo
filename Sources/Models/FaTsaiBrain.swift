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

    var inclusiveNumbers: [Int] = [Int]()

    var exclusiveNumbers: [Int] = [Int]()

    var numbersRange: (first: Int, last: Int)

    init(totalNumbersCount: Int, numbersRange: (first: Int, last: Int)) {
        self.totalNumbersCount = totalNumbersCount
        self.numbersRange = numbersRange
    }

    func randomNumbers() -> [Int] {
        guard requiredNumbersInRange() else {
            return []
        }
        guard isNumbersInRange(with: inclusiveNumbers) else {
            return []
        }
        let inclusiveNumbersSet = Set(inclusiveNumbers)
        var result = inclusiveNumbersSet
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

    private func isNumbersInRange(with numbers: [Int]) -> Bool {
        for number in numbers {
            if number < numbersRange.first {
                return false
            }
            if number > numbersRange.last {
                return false
            }
        }
        return true
    }


}
