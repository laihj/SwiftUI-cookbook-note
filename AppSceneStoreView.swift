//
//  AppSceneStoreView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct AppSceneStoreView: View {
    @AppStorage("username") var username: String = "Anonymous"
    @SceneStorage("selectedTab") var selectedTab: String?
    
    var body: some View {
        TabView(selection: $selectedTab) {
              Text("Tab 1")
                .tabItem {
                  Label("Tab 1", systemImage: "1.circle")
                }
                .tag("Tab1")

              Text("Tab 2")
                .tabItem {
                  Label("Tab 2", systemImage: "2.circle")
                }
                .tag("Tab2")
            }
//        VStack {
//              Text("Welcome, \(username)!")
//
//              Button("Log in") {
//                username = "SuzGupta"
//              }
//            }
    }
}

//In this example, the selectedTab variable is tagged with the @SceneStorage property wrapper, which means its value is automatically saved and restored across app launches or scene recreation. If the app is quit and relaunched, it will automatically select the tab that was last open.
//todo 没发现这种特性啊

#Preview {
    AppSceneStoreView()
}
