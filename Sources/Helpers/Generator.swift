//
//  Generator.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-08-22.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

final class Generator {

    func randomNumbers(between smallest: Int, _ largest: Int, totalNumbersNeeded total: Int) -> [Int] {
        guard largest - smallest + 1 >= total else {
            return []
        }

        var set = Set<Int>()

        while set.count < total {
            let randomInt = Int.random(in: smallest...largest)
            set.insert(randomInt)
        }

        return Array(set).sorted()
    }

}


