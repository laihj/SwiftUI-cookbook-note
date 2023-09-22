//
//  ProgressView.swift
//  cookbook
//
//  Created by laihj on 2023/9/21.
//

import SwiftUI

struct ProgressViewView: View {
    @State var progressValue = 0.5
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
                .padding()
            
            
            
            
        }
    }
}

#Preview {
    ProgressViewView()
}
