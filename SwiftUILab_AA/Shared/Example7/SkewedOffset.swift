//
//  SkewedOffset.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct SkewedOffset: GeometryEffect {
  var offset: CGFloat
  var pct: CGFloat
  let goingRight: Bool
  
  init(offset: CGFloat, pct: CGFloat, goingRight: Bool) {
    self.offset = offset
    self.pct = pct
    self.goingRight = goingRight
  }
  
  var animatableData: AnimatablePair<CGFloat, CGFloat> {
    get { return AnimatablePair<CGFloat, CGFloat>(offset, pct) }
    set {
      offset = newValue.first
      pct = newValue.second
    }
  }
  
  func effectValue(size: CGSize) -> ProjectionTransform {
    var skew: CGFloat
    
    if pct < 0.2 {
      skew = (pct * 5) * 0.5 * (goingRight ? -1 : 1)
    } else if pct > 0.8 {
      skew = ((1 - pct) * 5) * 0.5 * (goingRight ? -1 : 1)
    } else {
      skew = 0.5 * (goingRight ? -1 : 1)
    }
    
    return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
  }
}

