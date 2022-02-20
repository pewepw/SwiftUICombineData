//
//  LiteModeRow.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 20/02/2022.
//

import SwiftUI

struct LiteModeRow: View {
    @State private var isLiteMode: Bool = false
    
    var body: some View {
        Toggle(isOn: $isLiteMode) {
            HStack(spacing: 12) {
                GradientIcon(icon: "speedometer")
                VStack(alignment: .leading) {
                    Text("Lite Mode")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Better performance. Recommened for iPhone X and older.")
                        .font(.caption2)
                        .opacity(0.7)
                }
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: Color.themeAccentColor))
    }
}

struct LiteModeRow_Previews: PreviewProvider {
    static var previews: some View {
        LiteModeRow()
    }
}
