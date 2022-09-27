//
//  Home.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/06/02.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var store: Store
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink {
                    ProductDetailView(product: product).environmentObject(self.store)
                } label: {
                    ProductRow(product: product)
                }
                // defaultStyle은 자식 뷰의 버튼보다 상위 뷰의 버튼을 먼저 인식.
//                .buttonStyle(.plain)
            }
            .listStyle(.plain)
            .navigationTitle("과일마트")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        Preview(source: Home(store: Store()))
        Home().environmentObject(Store())
    }
}
