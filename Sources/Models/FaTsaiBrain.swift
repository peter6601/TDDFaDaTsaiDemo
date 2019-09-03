//
//  FaTsaiBrain.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

struct FaTsaiBrain {
    
    var selectNumbersCount: Int
    
    var containNumbers: [Int]
    
    var unContainNumbers: [Int]
    
    var continuitysNumbers: Int

    var numbersRange: (first: Int, last: Int)
    
    func checkResult( _ list: [Int] ) -> Bool {
        guard checkNumbersCount(selectNumbersCount, list: list) else {
            return false
        }
        guard checkNumbersRange(first: numbersRange.first, last: numbersRange.last, list: list) else {
            return false
        }
        guard checkNumbersContainNumbers(containNumbers, list: list) else {
            return false
        }
        guard checkNumbersNotsContainNumbers(unContainNumbers, list: list) else {
            return false
        }
        guard checkNumbersAreContinuitys(continuitysNumbers, list: list) else {
            return false
        }
        return true
    }
    
    func checkNumbersCount(_ count: Int, list: [Int]  ) -> Bool {
        guard list.count == count else {
            return false
        }
        return true
    }
    
    func checkNumbersRange(first: Int, last: Int, list: [Int] ) -> Bool {
        //待實作
        guard !list.isEmpty else {
            return false
        }
        guard let firstNumber = list.first else {
            return false
        }
        
        if first > firstNumber {
            return false
        }
        
        guard let lastNumber = list.last else {
            return false
        }
        
        if last < lastNumber {
            return false
        }
        
        return true
    }

    
    func checkNumbersContainNumbers(_ numbers: [Int], list: [Int] )-> Bool {
        var numberList = [Int: Bool]()

        for number in list {
            numberList[number] = true
        }
        
        for number in numbers {
            if  numberList[number] == nil {
                return false
            }
        }
        return true
    }
    
    func checkNumbersNotsContainNumbers(_ numbers: [Int], list: [Int] )-> Bool {
        
        var numberList = [Int: Bool]()
        for number in list {
            numberList[number] = true
        }
        
        for number in numbers {
            if  numberList[number] != nil {
                return false
            }
        }
        return true
    }
    
    func checkNumbersAreContinuitys(_ number: Int, list: [Int] )-> Bool {
        guard !list.isEmpty else {
            return false
        }
        var continuitysCount = 0
        for index in 1..<list.count {
            if (list[index-1] + 1) == list[index] {
                continuitysCount += 1
            } else {
                continuitysCount = 0
            }
        }
        if continuitysCount >= number {
            return true
        } else {
            return false
        }
    }
}
