//
//  Chapter3ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/05/30.
//

import SwiftUI

struct Chapter3ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("Button") {
                    print("Button1")
                }
                Button(action: { print("Button2") }) {
                    Text("Button")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                }
                Button(action: { print("Button3") }) {
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 80, height: 80)
                        .overlay(Text("Button"))
                }
                .tint(.green)
            }
            HStack(spacing: 20) {
                Button(action: { print("Button1") }) {
                    Image("fig")
                        .resizable()
                        .frame(width: 120, height: 120)
                }
                Button(action: { print("Button2") }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                        .font(.largeTitle)
                }
                .tint(.green)
            }.padding()
            VStack(spacing: 30) {
                Button("DefaultButtonStyle") {}
                    .buttonStyle(DefaultButtonStyle())
                Button("BorderlessButtonStyle") {}
                    .buttonStyle(.borderless)
                Button("PlainButtonStyle") {}
                    .buttonStyle(.plain)
            }
            Image(systemName: "person.circle")
                .imageScale(.large)
                .onTapGesture { print("onTapGesture") }
            Button(action: { print("버튼") }) {
                Image(systemName: "person.circle")
                    .imageScale(.large)
            }
        }
        
        List(0..<100) {
            Text("\($0)")
        }
        
        List([1,2,3,4,5,6,7,8], id: \.self) {
            Text("\($0)")
        }
        
        let rows: [User] = [User(name: "steve"), User(name: "james")]
        List(rows, id: \.name) {
            Text("\($0.name)")
        }
        
        let titles: [String] = ["Fruits", "Drinks"]
        let fruits: [String] = ["사과", "배", "포도", "바나나"]
        let drinks: [String] = ["물", "우유", "탄산수"]
        let data  : [[String]] = [fruits, drinks]
        List {
            Text("Fruits").font(.largeTitle)
            ForEach(fruits, id: \.self) {
                Text("\($0)")
            }
            Text("Drinks").font(.largeTitle)
            ForEach(drinks, id: \.self) {
                Text("\($0)")
            }
        }
        
        List {
            ForEach(data.indices) { idx in
                Section {
                    ForEach(data[idx], id: \.self) {
                        Text("\($0)")
                    }
                } header: {
                    Text(titles[idx]).font(.largeTitle)
                } footer: {
                    HStack { Spacer(); Text("\(data[idx].count)건") }
                }
            }
        }
        .listStyle(.grouped)
        .environment(\.horizontalSizeClass, .regular)
        
        GeometryReader { _ in
            Circle()
                .fill(.purple)
//                .frame(width: 200, height: 200)
                .overlay(Text("Center").font(.title))
        }.background(.gray)
        
        GeometryReader { _ in
            Circle()
                .fill(.blue)
                .frame(width: 350, height: 350)
            Circle()
                .fill(.orange)
                .frame(width: 280, height: 280)
            Circle()
                .fill(.purple)
                .frame(width: 200, height: 200)
            Text("TopLeading").font(.title)
        }.background(.gray)
        
        GeometryReader { proxy in
            Text("Geometry Reader")
                .font(.largeTitle).bold()
                .position(x: proxy.size.width / 2,
                          y: proxy.safeAreaInsets.top)

            VStack {
                Text("Size").bold()
                Text("width: \(proxy.size.width)")
                Text("height: \(proxy.size.height)")
            }.position(
                x: proxy.size.width / 2,
                y: proxy.size.height / 2.5)

            VStack {
                Text("SafeAreaInsets").bold()
                Text("top: \(proxy.safeAreaInsets.top)")
                Text("bottom: \(proxy.safeAreaInsets.bottom)")
            }.position(
                x: proxy.size.width / 2,
                y: proxy.size.height / 1.4)
        }
        .font(.title)
// iOS 14부터는 GeometryReader가 직접 안전 영역에 맞닿은 면에 한해 그 크기를 가져옴.
//        .frame(height: 500)
        .border(.green, width: 5)

//        HStack {
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 30)
//
//            VStack {
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(height: 200)
//
//                GeometryReader {
//                    self.contents(g: $0)
//                }
//                .background(Color.green, alignment: .center)
//                .border(Color.red, width: 4)
//            }
//            .coordinateSpace(name: "VStackCS")
//        }
//        .coordinateSpace(name: "HStackCS")
        
        
//        VStack {
//            Text("Frame Modifier")
//                .font(.title).bold()
//                .frame(width: 80, height: 30)
//            Rectangle()
//            Color.red
//            Image("SwiftUI").resizable()
//        }
        
        VStack {
            Text("Frame Modifier")
                .font(.title).bold()
//                .frame(width: 80, height: 30)
//                .fixedSize()
            Rectangle().frame(idealWidth: 100).fixedSize()
            Color.red.fixedSize()
            Image("SwiftUI").resizable().fixedSize()
        }.background(.orange)
    }
    
//    func contents(g: GeometryProxy) -> some View {
//        VStack {
//            Text("Local").bold()
//            Text(stringFormat(for: g.frame(in: .local).origin)).padding(.bottom)
//
//            Text("Global").bold()
//            Text(stringFormat(for: g.frame(in: .global).origin)).padding(.bottom)
//
//            Text("Named VStackCS").bold()
//            Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin)).padding(.bottom)
//
//            Text("Named HStackCS").bold()
//            Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin)).padding(.bottom)
//        }
//    }
//
//    func stringFormat(for point: CGPoint) -> String {
//        String(format: "(x: %.f, y: %.f)", [point.x, point.y])
//    }
}



struct User: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

struct Chapter3ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3ContentView()
    }
}
