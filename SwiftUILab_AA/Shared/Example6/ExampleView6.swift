//
//  Example6.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct ExampleView6: View {
  var body: some View {
    VStack {
      FlowerView().drawingGroup()
    }.modify {
      #if os(iOS)
      $0.padding(.bottom, 50)
      #else
      $0.padding(.bottom, 60)
      #endif
    }.navigationTitle(String.exampleTitle(5))
    .padding(20)
  }
}

struct Example6_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView6()
  }
}
