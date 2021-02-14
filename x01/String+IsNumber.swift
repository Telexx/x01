//
//  String+IsNumber.swift
//  x01
//
//  Created by Alec Henderson on 14/02/2021.
//

import Foundation

extension String {
    var isNumeric : Bool {
        return Double(self) != nil
    }
}
