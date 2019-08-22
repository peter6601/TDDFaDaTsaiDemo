//
//  ViewController.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/20.
//  Copyright © 2019 DinDin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private enum Constants {
        static let lotteryNumbersCount = 6
        static let smallesNumber = 1
        static let largestNumber = 49
    }

    private let generator = Generator()

    @IBOutlet private weak var selectedNumbersLabel: UILabel!

    @IBAction private func selectNumbersButtonTapped(_ sender: UIButton) {
        selectedNumbersLabel.text = generator.randomNumbers(between: Constants.smallesNumber, Constants.largestNumber, totalNumbersNeeded: Constants.lotteryNumbersCount).toStringWithComma
    }
}


class FaTsaiBrain {
    
    private(set) var list: [Int] = []
   
    init(_ list: [Int]) {
        self.list = list
    }
    
    func updateList(_ list: [Int]) {
        self.list = list
    }
    
    func checkNumbersCount(_ count: Int) -> Bool {
        //待實作
        return false
    }
   
    func checkNumbersRange(first: Int, last: Int) -> Bool {
        //待實作
        return false
    }
    
    func checkNumbersAreOdd()-> Bool {
        //待實作
        return false
    }
    
    func checkNumbersAreEven()-> Bool {
        //待實作
        return false
    }
    
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
