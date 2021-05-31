//
//  Example2PolygonShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct Example2PolygonShape: Shape {
  var sides: Int
  private var sidesAsDouble: Double
  
  var animatableData: Double {
    get { return sidesAsDouble }
    set { sidesAsDouble = newValue }
  }
  
  init(sides: Int) {
    self.sides = sides
    self.sidesAsDouble = Double(sides)
  }
  
  func path(in rect: CGRect) -> Path {
    
    // hypotenuse
    let h = Double(min(rect.size.width, rect.size.height)) / 2.0
    
    // center
    let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
    
    var path = Path()
    
    let extra: Int = sidesAsDouble != Double(Int(sidesAsDouble)) ? 1 : 0
    
    for i in 0..<Int(sidesAsDouble) + extra {
      let angle = (Double(i) * (360.0 / sidesAsDouble)) * Double.pi / 180
      
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

struct Example2PolygonShape_Previews: PreviewProvider {
  static var previews: some View {
    Example2PolygonShape(sides: 8)
  }
}
