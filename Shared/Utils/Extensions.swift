//
//  Extensions.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 19/02/2022.
//

import SwiftUI

extension View {
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(AngularGradient(colors: colors, center: .center, angle: .degrees(0)))
            .mask(self)
    }
    
    func linearGradientBackground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
    
    func blurBackground() -> some View {
        self.padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
