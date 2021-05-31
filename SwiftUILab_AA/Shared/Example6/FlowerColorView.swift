//
//  FlowerColor.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct FlowerColorView: View {
  let petals: Int
  let length: Double
  let color: Color
  
  @State private var animate = false
  
  var body: some View {
    let petalWidth1 = Angle(degrees: 2)
    let petalWidth2 = Angle(degrees: 360 / Double(self.petals)) * 2
    
    return GeometryReader { proxy in
      
      ForEach(0..<self.petals) { i in
        PetalShape(angle: Angle(degrees: Double(i) * 360 / Double(self.petals)), arc: self.animate ? petalWidth1 : petalWidth2, length: self.animate ? self.length : self.length * 0.9)
          .fill(RadialGradient(gradient: Gradient(colors: [self.color.opacity(0.2), self.color]), center: UnitPoint(x: 0.5, y: 0.5), startRadius: 0.1 * min(proxy.size.width, proxy.size.height) / 2.0, endRadius: min(proxy.size.width, proxy.size.height) / 2.0))
      }
      
    }.onAppear {
      withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
        self.animate = true
      }
    }
  }
}

struct FlowerColor_Previews: PreviewProvider {
  static var previews: some View {
    let length = 120.0
    FlowerColorView(petals: 5, length: length, color: Color.red)
  }
}
