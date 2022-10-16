//
//  Chapter5ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/09/01.
//

import SwiftUI

class User2: ObservableObject {
    let name : String = "User Name"
    @Published var score: Int = 0
}

struct Chapter5ContentView: View {
    @State private var isFavorite: Bool = true
    @State private var count     : Int  = 0
    @ObservedObject var user     : User2
    @State private var showingAlert: Bool = false
    @State private var showingActionSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Toggle(isOn: $isFavorite) {
                Text("isFavorite : \(isFavorite.description)")
            }
            Stepper("Count : \(count)", value: $count)
            Text(user.name)
            Button(action: { self.user.score += 1 }) {
                Text(user.score.description)
            }
            SuperView().environmentObject(User2())

            Button("ActionSheet") {
                self.showingActionSheet = true
            }
            .confirmationDialog("제목", isPresented: $showingActionSheet, titleVisibility: .visible) {
                Button("Dismiss", role: .cancel) { }
                Button("1") { }
                Button("2", role: .destructive) { }
            } message: {
                Text("내용")
            }
        }
        .padding()
    }
}

struct SuperView: View {
    var body: some View { SubView() }
}

struct SubView: View {
    @EnvironmentObject var user: User2
    var body: some View { Text(user.name.description) }
}

struct Chapter5ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter5ContentView(user: User2())
    }
}
