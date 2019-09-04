//
//  FaTsaiBrain.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

struct ConsecutiveNumbersInfo {
    var total: Int = 0
    var start: Int?

    init(total: Int, start: Int? = nil) {
        self.total = total
        self.start = start
    }
}

final class FaTsaiBrain {

    var totalNumbersCount: Int

    var inclusiveNumbers: [Int] = [Int]()
    
    var exclusiveNumbers: [Int] = [Int]()
    
    var consecutiveNumbersInfo: ConsecutiveNumbersInfo? = nil

    var numbersRange: (first: Int, last: Int)

    init(totalNumbersCount: Int, numbersRange: (first: Int, last: Int)) {
        self.totalNumbersCount = totalNumbersCount
        self.numbersRange = numbersRange
    }    

    private func requiredNumbersInRange() -> Bool {
        return numbersRange.last - numbersRange.first + 1 >= totalNumbersCount
    }

    private func consecutiveNumbers() -> Set<Int> {
        // Doesn't accept negative integer
        guard let info = consecutiveNumbersInfo,
            info.total > 0,
            info.total <= totalNumbersCount else {
            return []
        }

        // If has starting number
        // check if its within range
        // start has to be greater or equal the first number
        // start has to be less than the last number
        // check if the next one is within range

        var result = Set<Int>()

        if let start = info.start,
            start >= numbersRange.first,
            start < numbersRange.last {

            for i in start...start+info.total {
                result.insert(i)
            }
            return result
        }

        for i in 0..<info.total {
            result.insert(numbersRange.first + i)
        }

        return result
    }
}

extension FaTsaiBrain {
    func randomNumbers() -> [Int] {
        guard requiredNumbersInRange() else {
            return []
        }

        let inclusiveNumbersSet = Set(inclusiveNumbers)
        let exclusiveNumbersSet = Set(exclusiveNumbers)

        // This is to ensure that no inclusive numbers are in exclusive numbers
        // We can take this off
        if inclusiveNumbersSet.count < exclusiveNumbersSet.count {
            for num in inclusiveNumbersSet {
                if exclusiveNumbersSet.contains(num) {
                    return []
                }
            }
        }

        var result = inclusiveNumbersSet.union(consecutiveNumbers())

        if result.count > totalNumbersCount {
            return []
        }

        while result.count < totalNumbersCount {
            let randomInt = Int.random(in: numbersRange.first...numbersRange.last)
            if !exclusiveNumbersSet.contains(randomInt) {
                result.insert(randomInt)
            }
        }

        return Array(result).sorted()
    }
}
