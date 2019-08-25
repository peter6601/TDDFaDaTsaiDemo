//
//  FaTsaiBrain.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/25.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

class FaTsaiBrain {
    
    private(set) var list: [Int] = []
    
    init(_ list: [Int]) {
        self.list = list
    }
    
    func updateList(_ list: [Int]) {
        self.list = list
    }
    
    func checkNumbersCount(_ count: Int) -> Bool {
        guard self.list.count == count else {
            return false
        }
        return true
    }
    
    func checkNumbersRange(first: Int, last: Int) -> Bool {
        //待實作
        for number in list {
            if first > number {
                return false
            }
            if last < number {
                return false
                
            }
        }
        return true
    }
    
    //    func checkNumbersAreOdd()-> Bool {
    //        //待實作
    //        return false
    //    }
    //
    //    func checkNumbersAreEven()-> Bool {
    //        //待實作
    //        return false
    //    }
    
    func checkNumbersContainSpecificNumbers(_ numbers: [Int])-> Bool {
        //待實作
        return false
    }
    
    func checkNumbersNotsContainSpecificNumbers(_ numbers: [Int])-> Bool {
        //待實作
        return false
    }
    
    func checkNumbersAreContinuitys(_ number: Int)-> Bool {
        //待實作
        return false
    }
}
