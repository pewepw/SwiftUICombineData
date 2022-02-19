//
//  CertificatesView.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 19/02/2022.
//

 import SwiftUI

 struct CertificatesView: View {
     @StateObject var certificateVM = CertificateViewModel()
     
     var body: some View {
         VStack {
             ForEach(certificateVM.certificates) { certificate in
                 CertificateCard(certificate: certificate)
             }
         }
         .background(AccountBackground())
     }
 }

 struct CertificatesView_Previews: PreviewProvider {
     static var previews: some View {
         CertificatesView()
     }
 }

