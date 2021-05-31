//
//  MovingCounterModifier.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct MovingCounterModifier: AnimatableModifier {
  @State private var height: CGFloat = 0
  
  var number: Double
  
  var animatableData: Double {
    get { number }
    set { number = newValue }
  }
  
  func body(content: Content) -> some View {
    let n = self.number + 1
    
    let tOffset: CGFloat = getOffsetForTensDigit(n)
    let uOffset: CGFloat = getOffsetForUnitDigit(n)
    
    let u = [n - 2, n - 1, n + 0, n + 1, n + 2].map { getUnitDigit($0) }
    let x = getTensDigit(n)
    var t = [abs(x - 2), abs(x - 1), abs(x + 0), abs(x + 1), abs(x + 2)]
    t = t.map { getUnitDigit(Double($0)) }
    
    let font = Font.custom("Menlo", size: 34).bold()
    
    return HStack(alignment: .top, spacing: 0) {
      VStack {
        Text("\(t[0])").font(font)
        Text("\(t[1])").font(font)
        Text("\(t[2])").font(font)
        Text("\(t[3])").font(font)
        Text("\(t[4])").font(font)
      }.foregroundColor(.green).modifier(YShiftEffect(pct: tOffset))
      
      VStack {
        Text("\(u[0])").font(font)
        Text("\(u[1])").font(font)
        Text("\(u[2])").font(font)
        Text("\(u[3])").font(font)
        Text("\(u[4])").font(font)
      }.foregroundColor(.green).modifier(YShiftEffect(pct: uOffset))
    }
    .clipShape(MCMClipShape())
    .overlay(MCMBackShape().stroke(lineWidth: 5).foregroundColor(Color.blue)) // border
    .background(MCMBackShape().fill(Color.black)) // background
  }
  
  func getUnitDigit(_ number: Double) -> Int {
    return abs(Int(number) - ((Int(number) / 10) * 10))
  }
  
  func getTensDigit(_ number: Double) -> Int {
    return abs(Int(number) / 10)
  }
  
  func getOffsetForUnitDigit(_ number: Double) -> CGFloat {
    return 1 - CGFloat(number - Double(Int(number)))
  }
  
  func getOffsetForTensDigit(_ number: Double) -> CGFloat {
    if getUnitDigit(number) == 0 {
      return 1 - CGFloat(number - Double(Int(number)))
    } else {
      return 0
    }
  }
  
}
