//
//  StringExt.swift
//  Homie
//
//  Created by davix on 10/24/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

extension String {
    var asciiValue: UInt32 {
        guard let first = characters.first where characters.count == 1 else  { return 0 }
        return first.unicodeScalarsValue
    }
    func asciiValueAt(pos pos: UInt32) -> UInt32 {
        guard characters.count > 0 && Int(pos) < characters.count else  { return 0 }
        return Array(characters)[Int(pos)].unicodeScalarsValue
    }
}

extension Character {
    var unicodeScalarsValue: UInt32 {
        return String(self).unicodeScalars.first!.value
    }
}