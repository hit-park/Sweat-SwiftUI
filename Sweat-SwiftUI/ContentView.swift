//
//  ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink("Chapter 2") {
                    Chapter2ContentView()
                }
                NavigationLink("Chapter 3") {
                    Chapter3ContentView()
                }
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
