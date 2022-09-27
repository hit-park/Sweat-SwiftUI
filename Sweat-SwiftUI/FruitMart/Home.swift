//
//  Home.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/06/02.
//

import SwiftUI

struct Home: View {
    let store: Store
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                }
            }
            .listStyle(.plain)
            .navigationTitle("과일마트")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        Preview(source: Home(store: Store()))
        Home(store: Store())
    }
}
