//
//  PercentLabelView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct PercentLabelView: View {
  let pct: CGFloat
  
  var body: some View {
    Text("\(Int(pct * 100)) %")
      .font(.largeTitle)
      .fontWeight(.bold)
      .foregroundColor(.white)
  }
}

struct PercentLabelView_Previews: PreviewProvider {
  static var previews: some View {
    PercentLabelView(pct: 0.75)
  }
}
