//
//  LoadingView.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 70)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    LoadingView()
}
