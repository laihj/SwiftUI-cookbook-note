//
//  Demo3.swift
//  cookbook
//
//  Created by laihj on 2024/1/16.
//

import SwiftUI

struct Demo3: View {
    @State var items = (0...3).map { $0 }
    var body: some View {
        VStack {
            Button("In withAnimation") {
                withAnimation(.easeInOut) {
                    items.append(Int.random(in: 0...1000))
                }
            }
            Button("Not in withAnimation") { // 使用 Array 的扩展方法
                items.appendWithAnimation(Int.random(in: 0...1000), .easeInOut)
            }
            List {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                }
            }
            .frame(width: 500, height: 300)
        }
    }
}

struct Demo: View {
    @State var position: CGFloat = 40
    var body: some View {
        VStack {
            Text("Hi")
                .offset(x: position, y: position)
                .animation(.easeInOut, value: position)

            Slider(value: $position, in: 0...150)
            Button("Animate") {
                
                var transaction = Transaction(animation: .bouncy)
                // 没有指定时序曲线函数，将保留原有设置（本例为 easeInOut）
                if position < 100 { transaction.disablesAnimations = true }
                withTransaction(transaction) { // withTransaction 可以禁止原有事务的时序曲线函数（由 animation 相关联），但无法屏蔽由 transaction 关联的时序曲线函数
                    position = 0
                }
            }
        }
        .frame(width: 400, height: 500)
    }
}

struct TransitionDemo: View {
    @State var show = true
    var body: some View {
        VStack {
            Spacer()
            Text("Hello")
            if show {
                Text("World")
                    .transition(.scale) // 可动画部件（包装在其中）
            }
            Spacer()
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
        }
        .animation(.easeInOut(duration:0.5), value: show) // 创建关联依赖、设定时序曲线函数
        .frame(width: 300, height: 300)
    }
}

extension Array {
    mutating func appendWithAnimation(_ newElement: Element, _ animation: Animation?) {
        withAnimation(animation) {
            append(newElement)
        }
    }
}

#Preview {
    TransitionDemo()
}
