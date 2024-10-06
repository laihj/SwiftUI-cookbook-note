//
//  EffectAPI.swift
//  cookbook
//
//  Created by laihj on 2024/3/12.
//

import SwiftUI

struct CardItem : Identifiable{
    var id = UUID()
    var color:Color
}

var Items:[CardItem] =  [
    .init(color: .red),
    .init(color: .yellow),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .purple)
]

extension [CardItem] {
    func zIndex(_ item:CardItem) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }
        return .zero
    }
}

struct EffectAPI: View {
    @State private var isRotaionEnabled = true
    @State private var showsIndicator = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.red
                    .frame(height: 200)
                    .containerRelativeFrame(.horizontal, count: 4, span:2, spacing: 0)
                ScrollViewReader { scrollView in
                    ScrollView {
                                Button("Scroll to bottom") {
                                    withAnimation {
                                        scrollView.scrollTo(99, anchor: .center)
                                    }
                   
                                        }
                                ForEach(0..<100) { index in
                                    Text(String(index))
                                        .id(index)
                                }
                            }
                }
                ZStack {
                    Text("hello")
                        .visualEffect { content, geometryProxy in
                            content
                                .blur(radius: 2)
                        }
                }.padding()

                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(Items) { item in
                                CardView(item)
                                    .padding(.horizontal, 65)
                                    .frame(width: size.width)
                                    .visualEffect { content, geometryProxy in
                                        content
                                            .scaleEffect(scale(geometryProxy, scale: 0.1), anchor: .trailing)
                                            .rotationEffect(rotaion(geometryProxy, rotaion: isRotaionEnabled ? 5 : 0))
                                            .offset(x: minX(geometryProxy))
                                            .offset(x: excessX(geometryProxy, offset: isRotaionEnabled ? 4 : 0))
                                            
                                    }
                                    .zIndex(Items.zIndex(item))
                            }
                        }
                    }
                    .scrollIndicators(showsIndicator ? .visible : .hidden)
                    .scrollTargetBehavior(.paging)
//                    .scrollIndicatorsFlash(trigger: showsIndicator)
                }
                .frame(height: 380)
                .animation(.snappy, value: isRotaionEnabled)
                
                VStack(spacing: 10) {
                    Toggle("Rotation enable", isOn: $isRotaionEnabled)
                    Toggle("Show Indicatro", isOn: $showsIndicator)
                }.padding(15)
                    .background(.bar, in: .rect(cornerRadius: 15))
                    .padding(15)
            }
            .navigationTitle("Stacked Cards")
        }
    }
    
    @ViewBuilder
    func CardView(_ item:CardItem) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(item.color.gradient)
    }
    
    func minX(_ geo:GeometryProxy) -> CGFloat {
        //?????
        let minX = geo.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }
    
    func progress(_ geo: GeometryProxy, limit: CGFloat = 3) -> CGFloat {
        print(geo.frame(in: .scrollView(axis: .vertical)).maxX)
        let maxX = geo.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = geo.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)
        return cappedProgress
    }
    
    func scale(_ geo:GeometryProxy, scale:CGFloat = 0.1) -> CGFloat {
        let progress = progress(geo,limit: 2)
        return 1 - (progress * scale)
    }
    
    func excessX(_ geo:GeometryProxy, offset:CGFloat = 10) -> CGFloat {
        let progress = progress(geo)
        return progress * offset
    }
    
    func rotaion(_ geo:GeometryProxy, rotaion:CGFloat = 10) -> Angle {
        let progress = progress(geo)
        return .init(degrees: rotaion * progress)
    }
}

#Preview {
    EffectAPI()
}
