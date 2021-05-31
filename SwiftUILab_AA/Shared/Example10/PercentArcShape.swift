//
//  ArcShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct PercentArcShape: Shape {
  let pct: CGFloat
  
  func path(in rect: CGRect) -> Path {
    
    var p = Path()
    
    p.addArc(center: CGPoint(x: rect.width / 2.0, y:rect.height / 2.0),
             radius: rect.height / 2.0 + 5.0,
             startAngle: .degrees(0),
             endAngle: .degrees(360.0 * Double(pct)), clockwise: false)
    
    return p.strokedPath(.init(lineWidth: 10, dash: [6, 3], dashPhase: 10))
  }
}

struct PercentArcShape_Previews: PreviewProvider {
  static var previews: some View {
    PercentArcShape(pct: 0.75)
  }
}
