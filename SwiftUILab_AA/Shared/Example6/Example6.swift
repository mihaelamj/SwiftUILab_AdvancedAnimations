//
//  Example6.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

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
