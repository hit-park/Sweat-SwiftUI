//
//  Order.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/09/27.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 }
    
    let id      : Int
    let product : Product
    let quantity: Int
    
    var price: Int {
        product.price * quantity
    }
}
