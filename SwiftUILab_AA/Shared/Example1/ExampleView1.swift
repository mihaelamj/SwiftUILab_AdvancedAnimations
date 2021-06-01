//
//  Example1.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: - Part 1: Path Animations
// MARK: Example 1: Polygon animatable

struct ExampleView1: View {
  @State private var sides: Double = 4
  
  var body: some View {
    VStack {
      Example1PolygonShape(sides: sides)
        .stroke(Color.blue, lineWidth: 3)
        .padding(20)
        .animation(.easeInOut(duration: 1.0))
        .layoutPriority(1)
      
      Text("\(Int(sides)) sides").font(.headline)
      
      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1.0
        }
        
        MyButton(label: "3") {
          self.sides = 3.0
        }
        
        MyButton(label: "7") {
          self.sides = 7.0
        }
        
        MyButton(label: "30") {
          self.sides = 30.0
        }
      }.modify {
        #if os(iOS)
        $0.padding(.bottom, 50)
        #elseif os(macOS)
        $0.padding(.bottom, 60)
        #endif
      }
    }.navigationTitle(String.exampleTitle(0))
  }
}

struct Example1_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView1()
  }
}
