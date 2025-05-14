//
//  U1.swift
//  App1256
//
//  Created by IGOR on 14/05/2025.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            Image("R1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("The best financial manager for income")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                })
                .padding()
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    U1()
}
