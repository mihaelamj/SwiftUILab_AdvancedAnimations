//
//  PercentageIndicator.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct PercentageIndicatorModifier: AnimatableModifier {
  var pct: CGFloat = 0
  
  var animatableData: CGFloat {
    get { pct }
    set { pct = newValue }
  }
  
  func body(content: Content) -> some View {
    content
      .overlay(PercentArcShape(pct: pct).foregroundColor(.red))
      .overlay(PercentLabelView(pct: pct))
  }
  
}



