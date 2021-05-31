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
}
