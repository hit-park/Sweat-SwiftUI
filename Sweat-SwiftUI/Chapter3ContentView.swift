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
    }
}

struct Chapter3ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3ContentView()
    }
}
