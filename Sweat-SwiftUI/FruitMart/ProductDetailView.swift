//
//  ProductDetailView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/08/29.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @EnvironmentObject private var store: Store
    let product: Product
    
    var body: some View {
        VStack {
            productImage
            orderView
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    var productImage: some View {
        GeometryReader { _ in
            Image(product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                productDescription
                Spacer()
                priceInfo
                placeOrderButton
            }
            .padding(32)
            .frame(height: $0.size.height + 10)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
                FavoriteButton(prouduct: product)
            }
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        let price: Int = quantity * product.price
        return HStack {
            (Text("￦")
                + Text("\(price)").font(.title)
                ).fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button {
            self.showingAlert = true
        } label: {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(
                    Text("주문하기")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                )
                .padding(.vertical, 8)
        }
        .alert("주문 확인", isPresented: $showingAlert) {
            Button("확인") {
                self.store.placeOrder(product: self.product, quantity: self.quantity)
            }
            Button("취소", role: .cancel) {  }
        } message: {
            Text("\(product.name)을(를) \(quantity)개 구매하시겠습니까?")
        }
    }
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
            ?? text[centerIdx...].firstIndex(of: " ")
            ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let source1 = ProductDetailView(product: productSamples[2]).environmentObject(Store())
        let source2 = ProductDetailView(product: productSamples[1]).environmentObject(Store())
        return Group {
            Preview(source: source1)
            Preview(source: source2, devices: [.iPhone11Pro], displayDarkMode: false)
        }
    }
}
