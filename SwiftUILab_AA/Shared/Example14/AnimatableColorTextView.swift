//
//  AnimatableColorTextView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct AnimatableColorTextView: View {
  #if os(iOS)
  let from: UIColor
  let to: UIColor
  #else
  let from: NSColor
  let to: NSColor
  #endif
  let pct: CGFloat
  let text: () -> Text
  
  var body: some View {
    let textView = text()
    
    return textView.foregroundColor(Color.clear)
      .overlay(Color.clear.modifier(AnimatableColorTextModifier(from: from, to: to, pct: pct, text: textView)))
  }
}

struct AnimatableColorTextView_Previews: PreviewProvider {
  static var previews: some View {
    #if os(iOS)
    let from = UIColor.systemRed
    let to = UIColor.systemBlue
    #else
    let from = NSColor.systemRed
    let to = NSColor.systemBlue
    #endif
    
    let textBlock: () -> Text = { Text("Hello WWDC 2021!") }
    AnimatableColorTextView(from: from, to: to, pct: 0.75, text: textBlock)
  }
}
