//
//  MyButton.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import SwiftUI

struct MyButton: View {
  let label: String
  var font: Font = .title
  var textColor: Color = .white
  let action: () -> ()
  
  #if os(iOS)
  let pad: CGFloat = 10
  #else
  let pad: CGFloat = 0
  #endif
  
  var body: some View {
    Button(action: {
      self.action()
    }, label: {
      Text(label)
        .font(font)
        .padding(pad)
        .frame(width: 70)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
        .foregroundColor(textColor)
    })
  }
}
