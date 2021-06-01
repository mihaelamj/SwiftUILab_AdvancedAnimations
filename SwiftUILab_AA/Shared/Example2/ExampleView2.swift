//
//  Example2.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Example 2: Polygon with sides as Integer
struct ExampleView2: View {
  @State private var sides: Int = 4
  @State private var duration: Double = 1.0
  
  var body: some View {
    VStack {
      Example2PolygonShape(sides: sides)
        .stroke(Color.red, lineWidth: 3)
        .padding(20)
        .animation(.easeInOut(duration: duration))
        .layoutPriority(1)
      
      Text("\(Int(sides)) sides").font(.headline)
      
      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1
        }
        
        MyButton(label: "3") {
          self.sides = 3
        }
        
        MyButton(label: "7") {
          self.sides = 7
        }
        
        MyButton(label: "30") {
          self.sides = 30
        }
      }.modify {
        #if os(iOS)
        $0.padding(.bottom, 50)
        #else
        $0.padding(.bottom, 60)
        #endif
      }.navigationTitle(String.exampleTitle(1))
    }
  }
}

struct Example2_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView2()
  }
}
