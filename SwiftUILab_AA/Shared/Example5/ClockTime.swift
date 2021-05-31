//
//  ClockTime.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

import SwiftUI

struct ClockTime {
  var hours: Int      // Hour needle should jump by integer numbers
  var minutes: Int    // Minute needle should jump by integer numbers
  var seconds: Double // Second needle should move smoothly
  
  // Initializer with hour, minute and seconds
  init(_ h: Int, _ m: Int, _ s: Double) {
    self.hours = h
    self.minutes = m
    self.seconds = s
  }
  
  // Initializer with total of seconds
  init(_ seconds: Double) {
    let h = Int(seconds) / 3600
    let m = (Int(seconds) - (h * 3600)) / 60
    let s = seconds - Double((h * 3600) + (m * 60))
    
    self.hours = h
    self.minutes = m
    self.seconds = s
  }
  
  // compute number of seconds
  var asSeconds: Double {
    return Double(self.hours * 3600 + self.minutes * 60) + self.seconds
  }
  
  // show as string
  func asString() -> String {
    return String(format: "%2i", self.hours) + ":" + String(format: "%02i", self.minutes) + ":" + String(format: "%02.0f", self.seconds)
  }
}

extension ClockTime: VectorArithmetic {

  static func -= (lhs: inout ClockTime, rhs: ClockTime) {
    lhs = lhs - rhs
  }
  
  static func - (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
    return ClockTime(lhs.asSeconds - rhs.asSeconds)
  }
  
  static func += (lhs: inout ClockTime, rhs: ClockTime) {
    lhs = lhs + rhs
  }
  
  static func + (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
    return ClockTime(lhs.asSeconds + rhs.asSeconds)
  }
  
  mutating func scale(by rhs: Double) {
    var s = Double(self.asSeconds)
    s.scale(by: rhs)
    
    let ct = ClockTime(s)
    self.hours = ct.hours
    self.minutes = ct.minutes
    self.seconds = ct.seconds
  }
  
  var magnitudeSquared: Double { return asSeconds * asSeconds }
  
  static var zero: ClockTime {
    return ClockTime(0, 0, 0)
  }
  
}
