//
//  ContentView.swift
//  Shared
//
//  Created by Harry on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Text("Hello, world!")
                    .padding()
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
