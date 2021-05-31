//
//  Example7.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

// MARK: -
// MARK: Part 2: Geometry Effects
// MARK: Exmaple 6 - Skew
struct ExampleView7: View {
  @State private var moveIt = false
  
  var body: some View {
    let animation = Animation.easeInOut(duration: 1.0)
    
    return VStack {
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .red)
        .animation(animation)
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .orange)
        .animation(animation.delay(0.1))
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .yellow)
        .animation(animation.delay(0.2))
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .green)
        .animation(animation.delay(0.3))
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .blue)
        .animation(animation.delay(0.4))
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .purple)
        .animation(animation.delay(0.5))
      
      LabelView(text: "The SwiftUI Lab", offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: .pink)
        .animation(animation.delay(0.6))
      
      Button(action: { self.moveIt.toggle() }) { Text("Animate") }.padding(.top, 50)
    }
    .onTapGesture { self.moveIt.toggle()
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(6))
      #else
      $0.navigationTitle(String.exampleTitle(6))
      #endif
    }
  }
}

struct Example7_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView7()
  }
}
