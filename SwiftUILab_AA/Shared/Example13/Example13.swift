//
//  Example13.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

// MARK: - Example 13
struct Example13: View {
  @State private var flag = false
  @State private var number: Double = 21
  
  var body: some View {
    VStack {
      Color.clear
      
      Slider(value: $number, in: 0...99)
      Text("Number = \(number)")
      
      HStack(spacing: 10) {
        MyButton(label: "17", font: .headline) {
          withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 1, damping: 0.4, initialVelocity: 0.8)) {
            self.number = 17
          }
        }
        
        MyButton(label: "87", font: .headline) {
          withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 1, damping: 0.4, initialVelocity: 0.8)) {
            self.number = 23
          }
        }
        
        MyButton(label: "87", font: .headline) {
          withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 1, damping: 0.4, initialVelocity: 0.8)) {
            self.number = 87
          }
        }
      }
      
    }.overlay(MovingCounterView(number: number))
    .modify {
      #if os(iOS)
      $0.navigationBarTitle("SwiftUI Lab Mobile")
      #else
      $0.navigationTitle("SwiftUI Lab Desktop")
      #endif
    }
  }
}

struct Example13_Previews: PreviewProvider {
  static var previews: some View {
    Example13()
  }
}
