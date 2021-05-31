//
//  FlowerView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct FlowerView: View {
  @State private var animate = false
  
  let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
  
  var body: some View {
    ZStack {
      ForEach(0..<7) { i in
        FlowerColor(petals: self.getPetals(i), length: self.getLength(i), color: self.colors[i])
      }
      .rotationEffect(Angle(degrees: animate ? 360 : 0))
      .onAppear {
        withAnimation(Animation.easeInOut(duration: 25.0).repeatForever()) {
          self.animate = true
        }
      }
    }
  }
  
  func getLength(_ i: Int) -> Double {
    return 1 - (Double(i) * 1 / 7)
  }
  
  func getPetals(_ i: Int) -> Int {
    return i * 2 + 15
  }
}

struct FlowerView_Previews: PreviewProvider {
  static var previews: some View {
    FlowerView()
  }
}
