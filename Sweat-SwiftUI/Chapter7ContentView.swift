//
//  Chapter7ContentView.swift
//  Sweat-SwiftUI
//
//  Created by 희태 박 on 2022/10/31.
//

import SwiftUI

struct Chapter7ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
//        GeometryReader { geo in
//            VStack {
//                Text("Vertical ScrollView")
//                    .font(.largeTitle)
//                ScrollView() {
//                    ForEach(0..<10) { idx in
//                        Circle()
//                            .fill(Color(white: 0.2 + (0.8 * Double(idx) / 10)))
//                            .frame(width: 80, height: 80)
//                    }
//                    .frame(height: geo.size.width / 2)
//                }
//                .frame(height: geo.size.height / 2)
//                .padding(.bottom)
//
//                Text("Horizontal ScrollView")
//                    .font(.largeTitle)
//                ScrollView(.horizontal) {
//                    HStack {
//                        ForEach(0..<10) { idx in
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(.yellow)
//                                .frame(width: 100, height: 100)
//                                .scaleEffect(1 - (0.7 * CGFloat(idx) / 10))
//                        }
//                    }
//                    .frame(height: geo.size.height / 5)
//                    .padding(.horizontal)
//                }
//            }
//        }
        
        // ContentOffset
//        ScrollView {
//            ForEach(0..<10) { _ in
//                GeometryReader {
//                    Rectangle()
//                        .fill(self.color(proxy: $0))
//                }
//                .frame(width: 150, height: 150)
//            }
//        }
//        .background(.yellow)
        
        // Paging
//        let color: [Color] = [.red, .green, .blue]
//        return GeometryReader { proxy in
//            ScrollView(.horizontal) {
//                HStack(spacing: 0) {
//                    ForEach(color.indices) { idx in
//                        Circle()
//                            .fill(color[idx])
//                            .overlay(Text("\(idx) 페이지"))
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//                }
//                .background(.yellow)
//            }
//            .onAppear { UIScrollView.appearance().isPagingEnabled = true }
//        }
        
        // TabView
//        TabView {
//            VStack {
//                Text("첫번째 탭").font(.largeTitle)
//            }.tabItem {
//                Image(systemName: "house")
//                Text("아이템1")
//            }
//
//            Text("두번째 탭의 화면")
//                .font(.title)
//                .padding()
//                .background(.yellow)
//                .tabItem {
//                    Image(systemName: "cube")
//                    Text("아이템2")
//                }
//
//            Text("세번째 탭의 화면")
//                .font(.title)
//                .padding()
//                .background(.yellow)
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("아이템3")
//                }
//        }
        
        // TabView Tag
        TabView(selection: $selectedTab) {
            ForEach(0..<3) { idx in
                Text("태그 \(idx)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .tag(idx)
                    .tabItem {
                        Image(systemName: self.selectedTab != idx
                              ? "\(idx).square"
                              : "\(idx).square.fill"
                        )
                        .imageScale(.large)
//                        .foregroundColor(.red)
                    }
            }
        }
        .accentColor(.red)
    }
    
    func color(proxy: GeometryProxy) -> Color {
        let yOffset: CGFloat = proxy.frame(in: .global).minY - 44
        print(yOffset)
        let color = min(1, 0.2 + Double(yOffset / 1000))
        return Color(hue: color, saturation: color, brightness: color)
    }
}

struct Chapter7ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter7ContentView()
    }
}
