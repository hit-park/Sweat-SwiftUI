//
//  Chapter7ContentView.swift
//  Sweat-SwiftUI
//
//  Created by 희태 박 on 2022/10/31.
//

import SwiftUI

struct Chapter7ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Vertical ScrollView")
                    .font(.largeTitle)
                ScrollView() {
                    ForEach(0..<10) { idx in
                        Circle()
                            .fill(Color(white: 0.2 + (0.8 * Double(idx) / 10)))
                            .frame(width: 80, height: 80)
                    }
                    .frame(height: geo.size.width / 2)
                }
                .frame(height: geo.size.height / 2)
                .padding(.bottom)
                
                Text("Horizontal ScrollView")
                    .font(.largeTitle)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<10) { idx in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.yellow)
                                .frame(width: 100, height: 100)
                                .scaleEffect(1 - (0.7 * CGFloat(idx) / 10))
                        }
                    }
                    .frame(height: geo.size.height / 5)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct Chapter7ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter7ContentView()
    }
}
