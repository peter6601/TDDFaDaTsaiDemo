//
//  ViewController.swift
//  TDDFaDaTsaiDemo
//
//  Created by DinDin on 2019/8/20.
//  Copyright © 2019 DinDin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    func checkCount(_ count: Int) -> Bool {
        
    }
}
