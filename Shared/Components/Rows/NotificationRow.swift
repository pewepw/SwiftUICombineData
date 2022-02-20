//
//  NotificationRow.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 20/02/2022.
//

import SwiftUI

struct NotificationRow: View {
    @State private var subscribed: Bool = true
    
    var body: some View {
        Toggle(isOn: $subscribed) {
            HStack(spacing: 12) {
                GradientIcon(icon: "bell.fill")
                VStack(alignment: .leading) {
                    Text("Notify me of new content")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Max once a week")
                        .font(.caption2)
                        .opacity(0.7)
                }
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: Color.themeAccentColor))
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow()
    }
}
