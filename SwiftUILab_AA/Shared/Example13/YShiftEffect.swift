//
//  YShiftEffect.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct YShiftEffect: GeometryEffect {
  var pct: CGFloat = 1.0
  
  func effectValue(size: CGSize) -> ProjectionTransform {
    return .init(.init(translationX: 0, y: (size.height / 5.0) * pct))
  }
}
