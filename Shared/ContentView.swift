//
//  ContentView.swift
//  Shared
//
//  Created by Harry on 14/02/2022.
//

import SwiftUI

extension Color {
    static let themeAccentColor = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var contentOffset = CGFloat(0)
    @State private var showCertificates: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView { offset in
                    withAnimation {
                        contentOffset = offset.y
                    }
                } content: {
                    content
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
        .accentColor(colorScheme == .dark ? .white : Color.themeAccentColor)
    }
    
    var content: some View {
        VStack {
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }
            VStack {
                NavigationLink {
                    FAQView()
                } label: {
                    MenuRow()
                }
                
                divider
                
                NavigationLink {
                    PackagesView()
                } label: {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
                }
                
                divider
                
                Link(destination: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley")!) {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                }
            }
            .blurBackground()
            .padding(.top, 20)
            
            Text("Version 1.0")
                .foregroundColor(Color.white)
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(Color.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .sheet(isPresented: $showCertificates) {
            CertificatesView()
        }
    }
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
