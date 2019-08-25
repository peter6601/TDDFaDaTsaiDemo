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
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var getResultButton: UIButton!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        showNormalView()

        spinner.hidesWhenStopped = true
        getResultButton.isEnabled = false
    }

    private func showAlert(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "知道了", style: .cancel)
        controller.addAction(ok)
        present(controller, animated: true)
    }

    private func showLoadingView() {
        getResultButton.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()
    }

    private func showNormalView() {
        getResultButton.isHidden = false
        spinner.stopAnimating()
    }

    @IBAction private func selectNumbersButtonTapped(_ sender: UIButton) {
        selectedNumbersLabel.text = generator.randomNumbers(between: Constants.smallesNumber, Constants.largestNumber, totalNumbersNeeded: Constants.lotteryNumbersCount).toStringWithComma

        getResultButton.isEnabled = true
    }

    @IBAction private func getResultButtonTapped(_ sender: UIButton) {
        showLoadingView()
        _ = FaDaTsaiAPI().getResult { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let faDaTsai):
                strongSelf.resultLabel.text = faDaTsai.result.toStringWithComma

                let alertValue: (title: String, message: String) = {
                    if strongSelf.selectedNumbersLabel.text == strongSelf.resultLabel.text {
                        return ("恭喜", "發大財了")
                    }
                    return ("可惜", "離發大財只差一小步")
                }()

                strongSelf.showAlert(title: alertValue.title, message: alertValue.message)
            case .failure:
                break
            }

            strongSelf.showNormalView()
        }
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
