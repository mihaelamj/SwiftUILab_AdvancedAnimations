//
//  Indicator.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct PercentIndicatorView: View {
  var pct: CGFloat
  
  var body: some View {
    return Circle()
      .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
      .frame(width: 150, height: 150)
      .modifier(PercentageIndicatorModifier(pct: self.pct))
  }
}

struct PercentIndicatorView_Previews: PreviewProvider {
  static var previews: some View {
    PercentIndicatorView(pct: 0.75)
  }
}
