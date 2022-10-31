//
//  ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let leadingItem: Button = Button(action: { print("Leading item tapped") }) {
            Image(systemName: "bell").imageScale(.large)
        }
        let trailingItem = HStack {
            Button(action: { print("Trailing") }) {
                Image(systemName: "gear").imageScale(.large)
            }
            Button(action: { print("Trailing") }) {
                Image(systemName: "pencil").imageScale(.large)
            }
        }
        
        
        return NavigationView {
            VStack(spacing: 30) {
                NavigationLink("과일마트") {
                    Home().environmentObject(Store())//.navigationBarBackButtonHidden(true)
                }
                NavigationLink("Chapter 2") {
                    Chapter2ContentView()
                }
                NavigationLink("Chapter 3") {
                    Chapter3ContentView()
                }
                NavigationLink("Chapter 5") {
                    Chapter5ContentView(user: User2())
                }
                NavigationLink("Chapter 7") {
                    Chapter7ContentView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { leadingItem }
                ToolbarItem(placement: .navigationBarTrailing) { trailingItem }
            }
//            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
