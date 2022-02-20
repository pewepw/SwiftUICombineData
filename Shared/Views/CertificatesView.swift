//
//  CertificatesView.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 19/02/2022.
//

 import SwiftUI

 struct CertificatesView: View {
     @StateObject var certificateVM = CertificateViewModel()
     @State private var selection: Int = 0
     
     var body: some View {
         TabView(selection: $selection) {
             ForEach(certificateVM.certificates.indices, id: \.self) { index in
                 CertificateCard(selection: $selection)
                     .padding(.horizontal, 8)
                     .environmentObject(certificateVM)
             }
         }
         .tabViewStyle(.page(indexDisplayMode: .never))
         .background(AccountBackground())
     }
 }

 struct CertificatesView_Previews: PreviewProvider {
     static var previews: some View {
         CertificatesView()
     }
 }

