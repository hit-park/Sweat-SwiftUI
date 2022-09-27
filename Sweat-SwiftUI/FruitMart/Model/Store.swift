//
//  Store.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/06/20.
//

import Foundation

final class Store: ObservableObject {
    @Published var products: [Product]
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}

extension Store {
    func toggleFavorite(of proudct: Product) {
        guard let idx = products.firstIndex(of: proudct) else { return }
        products[idx].isFavorite.toggle()
    }
}
