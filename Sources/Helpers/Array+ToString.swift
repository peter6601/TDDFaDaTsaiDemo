//
//  Array+ToString.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-08-22.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

extension Array {
    var toStringWithComma: String {
        return self.map { String(describing: $0) }.joined(separator: ", ")
    }
}
