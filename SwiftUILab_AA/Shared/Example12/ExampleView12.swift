//
//  Example12.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct ExampleView12: View {
  @State private var flag = false
  
  var body: some View {
    VStack {
      Spacer()
      Color.clear.overlay(WaveTextView("The SwiftUI Lab", waveWidth: 6, pct: flag ? 1.0 : 0.0).foregroundColor(.blue)).frame(height: 40)
      Color.clear.overlay(WaveTextView("swiftui-lab.com", waveWidth: 6, pct: flag ? 0.0 : 1.0, size: 18).foregroundColor(.green)).frame(height: 30)
      Spacer()
    }.onAppear {
      withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
        self.flag.toggle()
      }
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(11))
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(11))
  }
}

struct Example12_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView12()
  }
}
