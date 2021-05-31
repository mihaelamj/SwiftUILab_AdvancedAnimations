//
//  MCMClipShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct MCMClipShape: Shape {
  func path(in rect: CGRect) -> Path {
    let r = rect
    let h = (r.height / 5.0 + 30.0)
    var p = Path()
    
    let cr = CGRect(x: 0, y: (r.height - h) / 2.0, width: r.width, height: h)
    p.addRoundedRect(in: cr, cornerSize: CGSize(width: 5.0, height: 5.0))
  
    return p
  }
}

struct MCMClipShape_Previews: PreviewProvider {
  static var previews: some View {
    MCMClipShape()
  }
}
