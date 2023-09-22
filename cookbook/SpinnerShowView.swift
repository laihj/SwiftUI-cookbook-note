//
//  SpinnerShowView.swift
//  cookbook
//
//  Created by laihj on 2023/9/22.
//

import SwiftUI

struct SpinnerShowView: View {
    var body: some View {
        SpinnerView()
    }
}

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(5.0,anchor: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    
                }
            }
    }
}

#Preview {
    SpinnerShowView()
}
