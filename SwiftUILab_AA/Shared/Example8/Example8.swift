//
//  Example8.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

// MARK: - Example 8 - Rotating Card
struct Example8: View {
  var body: some View {
    HStack {
      Spacer()
      RotatingCard()
      RotatingCard()
    }.background(Color.black)
    .modify {
      #if os(iOS)
      $0.navigationBarTitle(String.exampleTitle(7))
      #else
      $0.navigationTitle(String.exampleTitle(7))
      #endif
    }
  }
}

struct Example8_Previews: PreviewProvider {
  static var previews: some View {
    Example8()
  }
}
