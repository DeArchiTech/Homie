//
//  Stack.swift
//  Homie
//
//  Created by davix on 11/5/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

struct Stack<Element> {

    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    func size() -> Int {
        return items.count
    }
}