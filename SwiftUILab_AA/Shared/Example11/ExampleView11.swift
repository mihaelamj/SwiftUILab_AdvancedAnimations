//
//  Example11.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 11
struct ExampleView11: View {
  @State private var animate = false
  
  var body: some View {
    
    #if os(iOS)
    let gradient1: [UIColor] = [.blue, .green]
    let gradient2: [UIColor] = [.red, .yellow]
    #else
    let gradient1: [NSColor] = [.blue, .green]
    let gradient2: [NSColor] = [.red, .yellow]
    #endif
    
    return VStack {
      Spacer()
      
      Color.clear.frame(width: 200, height: 200)
        .overlay(Color.clear.modifier(AnimatableGradientModifier(from: gradient1, to: gradient2, pct: animate ? 1 : 0)))
      
      Spacer()
      
      Button("Toggle Gradient") {
        withAnimation(.easeInOut(duration: 1.0)) {
          self.animate.toggle()
        }
      }
    }.modify {
      #if os(iOS)
      $0.padding(.bottom, 50)
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(10))
  }
}

struct Example11_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView11()
  }
}
