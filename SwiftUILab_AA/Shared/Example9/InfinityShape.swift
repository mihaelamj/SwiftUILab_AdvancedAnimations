//
//  InfinityShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct InfinityShape: Shape {
  func path(in rect: CGRect) -> Path {
    return InfinityShape.createInfinityPath(in: rect)
  }
  
  static func createInfinityPath(in rect: CGRect) -> Path {
    let height = rect.size.height
    let width = rect.size.width
    let heightFactor = height/4
    let widthFactor = width/4
    
    var path = Path()
    
    path.move(to: CGPoint(x:widthFactor, y: heightFactor * 3))
    path.addCurve(to: CGPoint(x:widthFactor, y: heightFactor), control1: CGPoint(x:0, y: heightFactor * 3), control2: CGPoint(x:0, y: heightFactor))
    
    path.move(to: CGPoint(x:widthFactor, y: heightFactor))
    path.addCurve(to: CGPoint(x:widthFactor * 3, y: heightFactor * 3), control1: CGPoint(x:widthFactor * 2, y: heightFactor), control2: CGPoint(x:widthFactor * 2, y: heightFactor * 3))
    
    path.move(to: CGPoint(x:widthFactor * 3, y: heightFactor * 3))
    path.addCurve(to: CGPoint(x:widthFactor * 3, y: heightFactor), control1: CGPoint(x:widthFactor * 4 + 5, y: heightFactor * 3), control2: CGPoint(x:widthFactor * 4 + 5, y: heightFactor))
    
    path.move(to: CGPoint(x:widthFactor * 3, y: heightFactor))
    path.addCurve(to: CGPoint(x:widthFactor, y: heightFactor * 3), control1: CGPoint(x:widthFactor * 2, y: heightFactor), control2: CGPoint(x:widthFactor * 2, y: heightFactor * 3))
    
    return path
  }
}

struct InfinityShape_Previews: PreviewProvider {
  static var previews: some View {
    InfinityShape()
  }
}
