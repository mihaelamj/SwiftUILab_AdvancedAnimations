//
//  Example5.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

// MARK: - Example 5: Clock Shape
struct Example5: View {
  @State private var time: ClockTime = ClockTime(9, 50, 5)
  @State private var duration: Double = 2.0
  
  var body: some View {
    VStack {
      ClockShape(clockTime: time)
        .stroke(Color.blue, lineWidth: 3)
        .padding(20)
        .animation(.easeInOut(duration: duration))
        .layoutPriority(1)
      
      
      Text("\(time.asString())")
      
      HStack(spacing: 20) {
        MyButton(label: "9:51:45", font: .footnote, textColor: .black) {
          self.duration = 2.0
          self.time = ClockTime(9, 51, 45)
        }
        
        MyButton(label: "9:51:15", font: .footnote, textColor: .black) {
          self.duration = 2.0
          self.time = ClockTime(9, 51, 15)
        }
        
        MyButton(label: "9:52:15", font: .footnote, textColor: .black) {
          self.duration = 2.0
          self.time = ClockTime(9, 52, 15)
        }
        
        MyButton(label: "10:01:45", font: .caption, textColor: .black) {
          self.duration = 10.0
          self.time = ClockTime(10, 01, 45)
        }
        
      }
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle("05. Clock & Time".makePlatformDependantSwiftUILabTitle())
      #else
      $0.navigationTitle("05. Clock & Time".makePlatformDependantSwiftUILabTitle())
      #endif
    }
  }
}

struct Example5_Previews: PreviewProvider {
  static var previews: some View {
    Example5()
  }
}
