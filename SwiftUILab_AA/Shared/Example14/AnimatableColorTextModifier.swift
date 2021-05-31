//
//  AnimatableColorTextModifier.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct AnimatableColorTextModifier: AnimatableModifier {
  #if os(iOS)
  let from: UIColor
  let to: UIColor
  #else
  let from: NSColor
  let to: NSColor
  #endif
  var pct: CGFloat
  let text: Text
  
  var animatableData: CGFloat {
    get { pct }
    set { pct = newValue }
  }
  
  func body(content: Content) -> some View {
    return text.foregroundColor(colorMixer(c1: from, c2: to, pct: pct))
  }
  
  // This is a very basic implementation of a color interpolation
  // between two values.
  #if os(iOS)
  func colorMixer(c1: UIColor, c2: UIColor, pct: CGFloat) -> Color {
    guard let cc1 = c1.cgColor.components else { return Color(c1) }
    guard let cc2 = c2.cgColor.components else { return Color(c1) }
    
    let r = (cc1[0] + (cc2[0] - cc1[0]) * pct)
    let g = (cc1[1] + (cc2[1] - cc1[1]) * pct)
    let b = (cc1[2] + (cc2[2] - cc1[2]) * pct)
    
    return Color(red: Double(r), green: Double(g), blue: Double(b))
  }
  #else
  func colorMixer(c1: NSColor, c2: NSColor, pct: CGFloat) -> Color {
    guard let cc1 = c1.cgColor.components else { return Color(c1) }
    guard let cc2 = c2.cgColor.components else { return Color(c1) }
    
    let r = (cc1[0] + (cc2[0] - cc1[0]) * pct)
    let g = (cc1[1] + (cc2[1] - cc1[1]) * pct)
    let b = (cc1[2] + (cc2[2] - cc1[2]) * pct)
    
    return Color(red: Double(r), green: Double(g), blue: Double(b))
  }
  #endif
}

