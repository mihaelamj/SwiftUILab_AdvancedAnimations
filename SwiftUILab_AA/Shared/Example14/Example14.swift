//
//  Example14.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

// MARK: - Example 14
struct Example14: View {
  @State private var flag = false
  
  var body: some View {
    VStack {
      Spacer()
      #if os(iOS)
      AnimatableColorTextView(from: UIColor.systemRed, to: UIColor.systemGreen, pct: flag ? 1 : 0) {
        Text("Hola!").font(.largeTitle)
      }
      #else
      AnimatableColorTextView(from: NSColor.systemRed, to: NSColor.systemGreen, pct: flag ? 1 : 0) {
        Text("Hola!").font(.largeTitle)
      }
      #endif
      Spacer()
      Button("Toggle Color") {
        withAnimation(.easeInOut(duration: 2.0)) {
          self.flag.toggle()
        }
      }
      Spacer()
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle("14. Animated Text Color".makePlatformDependantSwiftUILabTitle())
      #else
      $0.navigationTitle("14. Animated Text Color".makePlatformDependantSwiftUILabTitle())
      #endif
    }
  }
}

struct Example14_Previews: PreviewProvider {
  static var previews: some View {
    Example14()
  }
}
