//
//  Generator.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-08-22.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

struct Generator {
    
    var faTsaiBrain: FaTsaiBrain

    func randomNumbers(between smallest: Int, _ largest: Int, totalNumbersNeeded total: Int, containNumbers: [Int] = [],  unContainNumbers: [Int] = []) -> [Int] {
        guard largest - smallest + 1 >= total else {
            return []
        }
        
        var set = Set<Int>()
        
        if !containNumbers.isEmpty {
            for number in containNumbers {
                set.insert(number)
            }
        }
        var unCotainSet = Set<Int>()

        if !unContainNumbers.isEmpty {
            for number in unContainNumbers {
                unCotainSet.insert(number)
            }
        }

        var list  = randomNumbersList(list: set, unCotainList: unCotainSet, between: smallest, largest, totalNumbersNeeded: total)
       
        while !faTsaiBrain.checkResult(list) {
            list = randomNumbersList(list: set, unCotainList: unCotainSet, between: smallest, largest, totalNumbersNeeded: total)
        }
        
        return list
    }
    
    
    private func randomNumbersList(list: Set<Int> , unCotainList: Set<Int>, between smallest: Int, _ largest: Int, totalNumbersNeeded total: Int) -> [Int] {
        var set = list
        while set.count < total {
            let randomInt = Int.random(in: smallest...largest)
            set.insert(randomInt)
            set.subtract(unCotainList)
        }
        return Array(set).sorted()
    }
}


