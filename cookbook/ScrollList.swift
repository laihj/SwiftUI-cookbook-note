//
//  ScrollList.swift
//  cookbook
//
//  Created by laihj on 2023/9/19.
//

import SwiftUI

struct ScrollList: View {
    @State private var numbers: [Int] = Array(1...20)
    @State private var isLoading = false
    @State private var isFinished = false

    
    var body: some View {
        NavigationStack {
            List {
                    ForEach(numbers, id: \.self) { number in
                      Text("Row \(number)")
                    }

                    if !isFinished {
                        //ProgressView 的 onAppear 里面 loadMoreContent
                      ProgressViewView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
                        .foregroundColor(.red)
                        .onAppear {
                          loadMoreContent()
                        }
                    }
                  }
                  .navigationTitle("Infinite List")
        }
    }
    
    func loadMoreContent() {
       if !isLoading {
         isLoading = true
         // This simulates an asynchronus call
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           let moreNumbers = numbers.count + 1...numbers.count + 20
           numbers.append(contentsOf: moreNumbers)
           isLoading = false
           if numbers.count > 250 {
             isFinished = true
           }
         }
       }
     }
    
    
}

#Preview {
    ScrollList()
}
