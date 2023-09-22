//
//  TimeCountView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct TimeCountView: View {
    @StateObject var timeManager = TimerManager()
    @State var counting = false
    var body: some View {
        VStack {
            Text("count time \(timeManager.timerCount)")
            
            Button {
                timeManager.start()
            } label: {
                Text("start")
            }
            
            Button {
                timeManager.stop()
            } label: {
                Text("stop")
            }


        }
    }
}

#Preview {
    TimeCountView()
}
