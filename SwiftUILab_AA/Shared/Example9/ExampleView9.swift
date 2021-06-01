//
//  Example9.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 9 - Follow Path
struct ExampleView9: View {
  @State private var flag = false
  
  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .topLeading) {
        
        // Draw the Infinity Shape
        InfinityShape().stroke(Color.purple, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [7, 7], dashPhase: 0))
          .foregroundColor(.blue)
          .frame(width: proxy.size.width, height: 300)
        
        // Animate movement of Image
        Image(systemName: "airplane").resizable().foregroundColor(Color.red)
          .frame(width: 50, height: 50).offset(x: -25, y: -25)
          .modifier(FollowEffect(pct: self.flag ? 1 : 0, path: InfinityShape.createInfinityPath(in: CGRect(x: 0, y: 0, width: proxy.size.width, height: 300)), rotate: true))
          .onAppear {
            withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
              self.flag.toggle()
            }
          }
        
      }.frame(alignment: .topLeading)
    }
    .padding(20)
    .modify {
      #if os(iOS)
      $0.padding(.bottom, 50)
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(8))
  }
}

struct Example9_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView9()
  }
}
