//
//  Example3PolygonShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct Example3PolygonShape: Shape {
  var sides: Double
  var scale: Double
  
  var animatableData: AnimatablePair<Double, Double> {
    get { AnimatablePair(sides, scale) }
    set {
      sides = newValue.first
      scale = newValue.second
    }
  }
  
  func path(in rect: CGRect) -> Path {
    // hypotenuse
    let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale
    
    // center
    let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
    
    var path = Path()
    
    let extra: Int = sides != Double(Int(sides)) ? 1 : 0
    
    for i in 0..<Int(sides) + extra {
      let angle = (Double(i) * (360.0 / sides)) * (Double.pi / 180)
      
      // Calculate vertex
      let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
      
      if i == 0 {
        path.move(to: pt) // move to first vertex
      } else {
        path.addLine(to: pt) // draw line to next vertex
      }
    }
    
    path.closeSubpath()
    
    return path
  }
}

struct Example3PolygonShape_Previews: PreviewProvider {
  static var previews: some View {
    Example3PolygonShape(sides: 8, scale: 1.3)
  }
}
