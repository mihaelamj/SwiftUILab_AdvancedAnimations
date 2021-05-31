//
//  Example3.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 3: Polygon with multiple animatable paramters
struct Example3: View {
  @State private var sides: Double = 4
  @State private var duration: Double = 1.0
  @State private var scale: Double = 1.0
  
  var body: some View {
    VStack {
      Example3PolygonShape(sides: sides, scale: scale)
        .stroke(Color.purple, lineWidth: 5)
        .padding(20)
        .animation(.easeInOut(duration: duration))
        .layoutPriority(1)
      
      Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")
      
      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1.0
          self.scale = 1.0
        }
        
        MyButton(label: "3") {
          self.sides = 3.0
          self.scale = 0.7
        }
        
        MyButton(label: "7") {
          self.sides = 7.0
          self.scale = 0.4
        }
        
        MyButton(label: "30") {
          self.sides = 30.0
          self.scale = 1.0
        }
        
      }
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(2))
      #else
      $0.navigationTitle(String.exampleTitle(2))
      #endif
    }
  }
}

struct Example3_Previews: PreviewProvider {
  static var previews: some View {
    Example3()
  }
}
