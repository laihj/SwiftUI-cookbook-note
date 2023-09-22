//
//  ObserView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct ObserView: View {
    @ObservedObject var settings = UserSettings()
    var body: some View {
        VStack {
          Text("Hello, \(settings.username)!")
          Button("Change Username") {
            settings.username = "John Doe"
          }
        }
    }
}

#Preview {
    ObserView()
}
