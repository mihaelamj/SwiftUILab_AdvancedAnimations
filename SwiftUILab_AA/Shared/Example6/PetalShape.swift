//
//  PetalShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct PetalShape: Shape {
  let angle: Angle
  var arc: Angle
  var length: Double
  
  var animatableData: AnimatablePair<Double, Double> {
    get { AnimatablePair(arc.degrees, length) }
    set {
      arc = Angle(degrees: newValue.first)
      length = newValue.second
    }
  }
  
  func path(in rect: CGRect) -> Path {
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let hypotenuse = Double(min(rect.width, rect.height)) / 2.0 * length
    
    let sep = arc / 2
    
    let to = CGPoint(x: CGFloat(cos(angle.radians) * Double(hypotenuse)) + center.x,
                     y: CGFloat(sin(angle.radians) * Double(hypotenuse)) + center.y)
    
    let ctrl1 = CGPoint(x: CGFloat(cos((angle + sep).radians) * Double(hypotenuse)) + center.x,
                        y: CGFloat(sin((angle + sep).radians) * Double(hypotenuse)) + center.y)
    
    let ctrl2 = CGPoint(x: CGFloat(cos((angle - sep).radians) * Double(hypotenuse)) + center.x,
                        y: CGFloat(sin((angle - sep).radians) * Double(hypotenuse)) + center.y)
    
    
    var path = Path()
    
    path.move(to: center)
    path.addQuadCurve(to: to, control: ctrl1)
    path.addQuadCurve(to: center, control: ctrl2)
    
    return path
  }
  
}

struct PetalShape_Previews: PreviewProvider {
  static var previews: some View {
    let angle = Angle(degrees: 90)
    let arc = Angle(degrees: 45)
    let length = 120.0
    PetalShape(angle: angle, arc: arc, length: length)
  }
}
