//
//  RightToLeft.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct RightToLeft: View {
    var body: some View {
        VStack {
              Text("This is a title in a child view with multiple lines")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
              
              Divider()
              
              VStack {
                Text("This is a title in a child view with multiple lines")
                  .font(.headline)
                  .frame(maxWidth: .infinity)
                  .padding()
                  .background(Color.blue)
                  .foregroundColor(.white)
              }
              .environment(\.layoutDirection, .rightToLeft)
            }
    }
}

#Preview {
    RightToLeft()
}
