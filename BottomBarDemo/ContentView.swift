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

// Now we need to create a extension so that we set the bottom sheet to right place
extension View {
    @ViewBuilder
    //Default tab bar heith is 49
    func bottomMaskForSheet(_ height: CGFloat = 49) -> some View {
        self.background()
    }
}


//Helpers
fileprivate struct SheetRootViewFiner: UIViewRepresentable {
    
    var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> some UIView {
        .init()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
        }
    }
    
    class Coordinator: NSObject {
        var isMasked = false
    }
}

fileprivate extension UIView {
    
}
