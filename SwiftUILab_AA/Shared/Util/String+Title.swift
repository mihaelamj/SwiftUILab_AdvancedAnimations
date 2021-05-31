//
//  String+Title.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import Foundation

public extension String {
  func makePlatformDependantSwiftUILabTitle() -> String {
    #if os(iOS)
    return "SwiftUI Lab Mobile: \(self)"
    #else
    return "SwiftUI Lab Desktop: \(self)"
    #endif
  }
  
  static func swiftUILabExampleName(index: Int) -> String {
    let exampleNames = [
      "Shape Sides 1",
      "Shape Sides 2",
      "Shape Sides 3",
      "Shape Sides 4",
      "Clock & Time",
      "Flower",
      "Drunk Labels",
      "Rotating Cards",
      "Following a Path",
      "Circle Percent",
      "Animated Gradients",
      "Animated Wawe Text",
      "Moving Counter",
      "Animated Text Color"
    ]
    
    let name = exampleNames.indices.contains(index) ? exampleNames[index] : "Unknown"
    return name
  }
  
  static func exampleTitle(_ index: Int) -> String {
    let name = swiftUILabExampleName(index: index)
    return "\(index + 1). \(name.makePlatformDependantSwiftUILabTitle())"
  }
}
