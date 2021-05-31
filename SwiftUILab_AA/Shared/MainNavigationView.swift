//
//  MainNavigationView.swift
//  SwiftUILab_AA
//
//  Created by Mihaela Mihaljevic Jakic on 31.05.2021..
//  Original ghist: (https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798)

import SwiftUI

struct MainNavigationView: View {

  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Part 1: Path Animations")) {
          NavigationLink(destination: ExampleView1(), label: {
            Text("Example 1 (sides: Double)")
          })
          
          NavigationLink(destination: ExampleView2(), label: {
            Text("Example 2 (sides: Int)")
          })
          
          NavigationLink(destination: ExampleView3(), label: {
            Text("Example 3 (sides & scale)")
          })
          
          NavigationLink(destination: ExampleView4(), label: {
            Text("Example 4 (vertex to vertex)")
          })
          
          NavigationLink(destination: ExampleView5(), label: {
            Text("Example 5 (clock)")
          })
          
          NavigationLink(destination: ExampleView6(), label: {
            Text("Example 6 (metal)")
          })
        }
        
        Section(header: Text("Part 2: Geometry Effect")) {
          NavigationLink(destination: ExampleView7(), label: {
            Text("Example 7 (skew)")
          })
          
          NavigationLink(destination: ExampleView8(), label: {
            Text("Example 8 (rotating card)")
          })
          
          NavigationLink(destination: ExampleView9(), label: {
            Text("Example 9 (follow path)")
          })
        }
        
        Section(header: Text("Part 3: Animatable Modifier")) {
          NavigationLink(destination: ExampleView10(), label: {
            Text("Example 10 (progress indicator)")
          })
          
          NavigationLink(destination: ExampleView11(), label: {
            Text("Example 11 (gradient)")
          })
          
          NavigationLink(destination: ExampleView12(), label: {
            Text("Example 12 (wave text)")
          })
          
          NavigationLink(destination: ExampleView13(), label: {
            Text("Example 13 (counter)")
          })
          
          NavigationLink(destination: ExampleView14(), label: {
            Text("Example 14 (animatable text color)")
          })
          
        }
        
      }.modify {
        #if os(iOS)
        $0.navigationBarTitle("SwiftUI Lab Mobile")
        #else
        $0.navigationTitle("SwiftUI Lab Desktop")
        #endif
      }
    }
  }
}

struct MainNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    MainNavigationView()
  }
}
