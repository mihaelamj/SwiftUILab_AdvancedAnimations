//
//  Example6.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct Example6: View {
  var body: some View {
    VStack {
      FlowerView().drawingGroup()
    }.modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(5))
      #else
      $0.navigationTitle(String.exampleTitle(5))
      #endif
    }
    .padding(20)
  }
}

struct Example6_Previews: PreviewProvider {
  static var previews: some View {
    Example6()
  }
}
