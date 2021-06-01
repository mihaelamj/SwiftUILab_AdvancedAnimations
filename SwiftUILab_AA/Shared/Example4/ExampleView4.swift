//
//  Example4.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 4: Polygon with lines vertex-to-vertex
struct ExampleView4: View {
  @State private var sides: Double = 4
  @State private var scale: Double = 1.0
  
  var body: some View {
    VStack {
      Example4PolygonShape(sides: sides, scale: scale)
        .stroke(Color.pink, lineWidth: (sides < 3) ? 10 : ( sides < 7 ? 5 : 2))
        .padding(20)
        .animation(.easeInOut(duration: 3.0))
        .layoutPriority(1)
      
      
      Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")
      
      Slider(value: $sides, in: 0...30)
      
      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1.0
          self.scale = 1.0
        }
        
        MyButton(label: "3") {
          self.sides = 3.0
          self.scale = 1.0
        }
        
        MyButton(label: "7") {
          self.sides = 7.0
          self.scale = 1.0
        }
        
        MyButton(label: "30") {
          self.sides = 30.0
          self.scale = 1.0
        }
        
      }
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(3))
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(3))
  }
}

struct Example4_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView4()
  }
}
