//
//  RotatingCard.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct RotatingCardView: View {
  @State private var flipped = false
  @State private var animate3d = false
  @State private var rotate = false
  @State private var imgIndex = 0
  
  let images = ["diamonds-7", "clubs-8", "diamonds-6", "clubs-b", "hearts-2", "diamonds-b"]
  
  var body: some View {
    let binding = Binding<Bool>(get: { self.flipped }, set: { self.updateBinding($0) })
    
    return VStack {
      Spacer()
      Image(flipped ? "back" : images[imgIndex]).resizable()
        .frame(width: 212, height: 320)
        .modifier(FlipEffect(flipped: binding, angle: animate3d ? 360 : 0, axis: (x: 1, y: 5)))//**
        .rotationEffect(Angle(degrees: rotate ? 0 : 360))
        .onAppear {
          withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
            self.animate3d = true
          }
          
          withAnimation(Animation.linear(duration: 8.0).repeatForever(autoreverses: false)) {
            self.rotate = true
          }
        }
      Spacer()
    }
  }
  
  func updateBinding(_ value: Bool) {
    // If card was just flipped and at front, change the card
    if flipped != value && !flipped {
      self.imgIndex = self.imgIndex+1 < self.images.count ? self.imgIndex+1 : 0
    }
    
    flipped = value
  }
}

struct RotatingCard_Previews: PreviewProvider {
  static var previews: some View {
    RotatingCardView()
  }
}
