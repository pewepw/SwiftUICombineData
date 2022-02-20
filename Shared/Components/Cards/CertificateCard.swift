//
//  CertificateCard.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 19/02/2022.
//

import SwiftUI

struct CertificateCard: View {
    @EnvironmentObject var certificateVM: CertificateViewModel
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Image("CertificateBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            if certificateVM.certificates.count > 0 {
                content
            } else {
                Text("No certificate")
            }
        }
        .frame(maxWidth: 754, maxHeight: 465)
        .background(
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9921568627, green: 0.2470588235, blue: 0.2, alpha: 0.7949869118)).opacity(0.8), Color(#colorLiteral(red: 0.2980392157, green: 0, blue: 0.7843137255, alpha: 0.6)).opacity(0.2)]), center: .bottomTrailing, startRadius: 5, endRadius: 900)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .stroke(Color.white)
                .blendMode(.overlay)
        )
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        //.mask(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.1647058824, green: 0.1098039216, blue: 0.3568627451, alpha: 1)).opacity(0.5), radius: 30, x: 0, y: 15)
    }
    
    var content: some View {
        VStack(spacing: 20) {
            Image(certificateVM.certificates[selection].logo)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(8)
                .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
                .mask(Circle())
                .background(Circle().stroke(.white.opacity(0.4), lineWidth: 0.5))
            
            Section {
                Text("Certificate of completion")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("this is to certify that")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
            }
            .textCase(.uppercase)
            
            Text("John")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Successfully completed the online course \(certificateVM.certificates[selection].course) on \(certificateVM.certificates[selection].date)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: 250)
            
            Section {
                Divider()
                instructorRow
                Divider()
                certificateDataRow
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 20)
        }
    }
    
    var instructorRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Instructor")
            Text(certificateVM.certificates[selection].instructor)
        }
    }
    
    var certificateDataRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Certificate no: DC-\(certificateVM.certificates[selection].id)")
            Text("Certificate url: http://www.\(certificateVM.certificates[selection].id)")
        }
    }
}

struct CertificateCard_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCard(selection: Binding.constant(0))
            .environmentObject(CertificateViewModel())
    }
}
