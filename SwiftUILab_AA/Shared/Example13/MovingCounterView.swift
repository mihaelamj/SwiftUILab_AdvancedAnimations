//
//  MovingCounterView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct MovingCounterView: View {
  let number: Double
  
  var body: some View {
    Text("00")
      .modifier(MovingCounterModifier(number: number))
  }
}

struct MMovingCounterView_Previews: PreviewProvider {
  static var previews: some View {
    MovingCounterView(number: 88)
  }
}
