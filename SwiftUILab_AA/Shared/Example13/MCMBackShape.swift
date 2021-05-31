//
//  MCMBackShape.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct MCMBackShape: Shape {
  func path(in rect: CGRect) -> Path {
    let r = rect
    let h = (r.height / 5.0 + 30.0)
    var p = Path()
    
    let cr = CGRect(x: (rect.width - 80)/2, y: (r.height - h) / 2.0, width: 80, height: h)
    p.addRoundedRect(in: cr, cornerSize: CGSize(width: 5.0, height: 5.0))
    
    return p
  }
}

struct MCMBackShape_Previews: PreviewProvider {
  static var previews: some View {
    MCMBackShape()
  }
}
