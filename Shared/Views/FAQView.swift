//
//  FAQView.swift
//  SwiftUICombineData
//
//  Created by Harry on 16/02/2022.
//

import SwiftUI

struct FAQView: View {
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(axes: .vertical) { offsetPoint in
                withAnimation {
                    contentOffset = offsetPoint.y
                }
            } content: {
                content
            }
            
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1: 0)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ")
        .background {
            Color("Background 2")
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(faqData) { faq in
                FAQRow(faq: faq)
            }
            
            Text("Have any question?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .opacity(0.7)
        }
        .padding(.horizontal, 20)
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
