//
//  WaveTextView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct WaveTextView: View {
  let text: String
  let pct: Double
  let waveWidth: Int
  var size: CGFloat
  
  init(_ text: String, waveWidth: Int, pct: Double, size: CGFloat = 34) {
    self.text = text
    self.waveWidth = waveWidth
    self.pct = pct
    self.size = size
  }
  
  var body: some View {
    Text(text).foregroundColor(Color.clear).modifier(WaveTextModifier(text: text, waveWidth: waveWidth, pct: pct, size: size))
  }
}

struct WaveTextView_Previews: PreviewProvider {
  static var previews: some View {
    WaveTextView("Animate SwiftUI", waveWidth: 50, pct: 0.25)
  }
}
