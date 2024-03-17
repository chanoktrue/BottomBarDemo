//
//  ContentView.swift
//  BottomBarDemo
//
//  Created by Thongchai Subsaidee on 18/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .tag(tab)
                    .tabItem {
                        Image(systemName: tab.symbols)
                        Text(tab.rawValue)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
