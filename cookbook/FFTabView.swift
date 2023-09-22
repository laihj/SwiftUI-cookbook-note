//
//  FFTabView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct FFTabView: View {
    var body: some View {
        TabView {
            Text("Tab 1's a star!")
                .tabItem {
                    Image(systemName: "star")
                    Text("Tab 1")
                }.tag(1)
                .toolbarBackground(.hidden, for: .tabBar)
            
            Text("Show the love for Tab 2!")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Tab 2")
                }.tag(2)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.orange.opacity(0.8), for: .tabBar)
            
            Text("Third Tab")
                    .tabItem {
                      Image(systemName: "3.square.fill")
                      Text("Third")
                    }
                    .tag(3)
        }
    }
}

#Preview {
    FFTabView()
}
