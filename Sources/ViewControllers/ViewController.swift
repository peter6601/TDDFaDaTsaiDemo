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
        static let largestNumber = 38
    }

    private let viewModel = FaTsaiViewModel(faTsaiBrain: FaTsaiBrain(totalNumbersCount: Constants.lotteryNumbersCount, numbersRange: (Constants.smallesNumber, Constants.largestNumber)))

    @IBOutlet private weak var selectedNumbersLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var getResultButton: UIButton!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        showNormalView()

        spinner.hidesWhenStopped = true
        getResultButton.isEnabled = false

        faTsaiBrianSetup()

        viewModel.delegate = self
    }

    private func faTsaiBrianSetup() {
        // UI to ViewModel

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
        selectedNumbersLabel.text = viewModel.randomNumbersString
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

extension ViewController: FaTsaiViewModelDelegate {

}
