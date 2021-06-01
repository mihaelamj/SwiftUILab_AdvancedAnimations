//
//  Example10.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 10
struct ExampleView10: View {
  @State private var percent: CGFloat = 0
  
  var body: some View {
    VStack {
      Spacer()
      Color.clear.overlay(PercentIndicatorView(pct: self.percent))
      
      Spacer()
      HStack(spacing: 10) {
        MyButton(label: "0%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { self.percent = 0 } }
        
        MyButton(label: "27%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { self.percent = 0.27 } }
        
        MyButton(label: "100%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { self.percent = 1.0 } }
      }
    } .modify {
      #if os(iOS)
      $0.padding(.bottom, 50)
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(9))
  }
}

struct Example10_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView10()
  }
}
