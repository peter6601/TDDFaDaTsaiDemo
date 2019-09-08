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
    
    func randomNumbers() -> [Int] {
        
        guard requiredNumbersInRange() else {
            return []
        }
        guard numbersInRange(inclusiveNumbers, numbersRange: (numbersRange.first, numbersRange.last)) else {
            return []
        }
        
        guard numbersInRange(exclusiveNumbers, numbersRange: (numbersRange.first, numbersRange.last)) else {
            return []
        }
        
        let inclusiveNumbersSet = Set(inclusiveNumbers)
        let exclusiveNumbersSet = Set(exclusiveNumbers)
        
        
        var result = inclusiveNumbersSet.union(consecutiveNumbers(numbersRange: (first: numbersRange.first, last: numbersRange.last)))
        
        guard result.count <= totalNumbersCount else {
            return []
        }
        
        guard !compareInclusiveNumebr(result, with: exclusiveNumbersSet) else {
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

extension FaTsaiBrain {
   
    private func requiredNumbersInRange() -> Bool {
        return numbersRange.last - numbersRange.first + 1 >= totalNumbersCount
    }
    
    
    private func compareInclusiveNumebr(_ fistList: Set<Int>, with sencondList: Set<Int>) -> Bool {
        let list = fistList.intersection(sencondList)
        return !list.isEmpty
    }
    
    private func numbersInRange(_ numbers: [Int], numbersRange: (first: Int, last: Int)) -> Bool {
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
    
    private func consecutiveNumbers(numbersRange: (first: Int, last: Int)) -> Set<Int> {
        // Doesn't accept negative integer
        guard let info = consecutiveNumbersInfo,
            info.total > 0 else {
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
        
        let randomStart =  Int.random(in: numbersRange.first...(numbersRange.last - info.total))
        for i in randomStart..<(randomStart + info.total) {
            result.insert(i)
        }
        return result
    }
}
