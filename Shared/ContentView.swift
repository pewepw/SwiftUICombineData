//
//  ContentView.swift
//  Shared
//
//  Created by Harry on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView { offset in
                    withAnimation {
                        contentOffset = offset.y
                    }
                    print(contentOffset)
                } content: {
                    Text("Hello, world!")
                        .padding()
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1: 0)
                    //.animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
