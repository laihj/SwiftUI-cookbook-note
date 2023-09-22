//
//  AnimateProgressBar.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct AnimateProgressBar: View {
    @State private var progress: CGFloat = 0.0

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 300, height: 20)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Rectangle()
                .frame(width: 300 * progress, height: 20)
                .opacity(0.3)
                .foregroundColor(.green)
        }
        .onReceive(timer, perform: { _ in
            if progress < 1.0 {
                progress += 0.01
            }
        })
    }
}

#Preview {
    AnimateProgressBar()
}
