//
//  Double+Angle.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//

import Foundation

extension Double {
  var rad: Double { return self * .pi / 180 }
  var deg: Double { return self * 180 / .pi }
}
