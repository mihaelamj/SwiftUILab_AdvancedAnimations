//
//  PercentLabelView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

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
    PercentLabelView(pct: 75)
  }
}
