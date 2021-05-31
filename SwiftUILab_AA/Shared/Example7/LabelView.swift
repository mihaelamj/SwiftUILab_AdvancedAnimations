//
//  LabelView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct LabelView: View {
  let text: String
  var offset: CGFloat
  var pct: CGFloat
  let backgroundColor: Color
  
  var body: some View {
    
    Text("The SwiftUI Lab")
      .font(.headline)
      .padding(5)
      .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
      .foregroundColor(Color.black)
      .modifier(SkewedOffset(offset: offset, pct: pct, goingRight: offset > 0))
  }
}

struct LabelView_Previews: PreviewProvider {
  static var previews: some View {
    LabelView(text: "LabelView", offset: 10, pct: 1, backgroundColor: Color.red)
  }
}
