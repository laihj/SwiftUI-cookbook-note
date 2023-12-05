//
//  NaviStack.swift
//  cookbook
//
//  Created by laihj on 2023/10/9.
//

import SwiftUI


struct Counter {
    var count:Int
    var count2:Int
}

struct NaviStack: View {
    private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
    
    @State private var counter = Counter(count: 10, count2: 22)
    
    @State private var path: [Color] = []
    var body: some View {
        NavigationStack(path: $path) {
                    List(bgColors, id: \.self) { bgColor in
                        NavigationLink(value: bgColor) {
                                            Text(bgColor.description)
                                        }
         
                    }
                    .listStyle(.grouped)
                    .navigationDestination(for: Color.self) { color in
                        ColorView(path:$path)
                    }

                }
        Button {
            counter.count += 1
            tapCount()
            path = []
//            if  path.count > 0 {
//                path.removeLast()
//            }
        } label: {
            Text("tap \(counter.count2)")
        }

    }
    
    func tapCount() {
        counter = Counter(count: 10, count2: 44)
    }
}

#Preview {
    NaviStack()
}


struct ColorView: View {
    var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
    @Binding var path: [Color]
    var body: some View {
        VStack {
            Text("\(path.count), \(path.description)")
                .font(.headline)
            
            HStack {
                ForEach(path, id: \.self) { color in
                    color
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            }
            
            List(bgColors, id: \.self) { bgColor in
                
                NavigationLink(value: bgColor) {
                    Text(bgColor.description)
                }
                
            }
            .listStyle(.inset)
            
        }
        // 自定义 back item
        .navigationBarBackButtonHidden()
        .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                        Button {
                            path.removeLast()
                        } label: {
                            Image(systemName: "chevron.left.circle")
                        }
                    }
                }
    }
}
