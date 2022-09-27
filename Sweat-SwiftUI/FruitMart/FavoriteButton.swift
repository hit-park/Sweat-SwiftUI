//
//  FavoriteButton.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/09/27.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let prouduct: Product
    
    private var imageName: String {
        prouduct.isFavorite ? "heart.fill" : "heart"
    }
    
    var body: some View {
//        Button {
//            self.store.toggleFavorite(of: self.prouduct)
//        } label: {
//            Image(systemName: imageName)
//                .imageScale(.large)
//                .foregroundColor(.peach)
//                .frame(width: 32, height: 32)
//        }
        Image(systemName: imageName)
            .imageScale(.large)
            .foregroundColor(.peach)
            .frame(width: 32, height: 32)
            .onTapGesture { // 제스처는 네비게이션 링크나 버튼 같은 컨트롤보다 터치이벤트에 대한 우선순위가 높다.
                self.store.toggleFavorite(of: self.prouduct)
            }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(prouduct: productSamples[2])
    }
}
