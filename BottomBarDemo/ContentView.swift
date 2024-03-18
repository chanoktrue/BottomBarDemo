//
//  ContentView.swift
//  BottomBarDemo
//
//  Created by Thongchai Subsaidee on 18/3/24.
//

import SwiftUI

struct ContentView: View {
    
    //View
    @State private var isShowSheet = false
    
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
        .task {
            isShowSheet = true
        }
        .sheet(isPresented: $isShowSheet, content: {
            VStack{
                Text("Placeholder")
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            
        })
        
        
    }
}

#Preview {
    ContentView()
}
