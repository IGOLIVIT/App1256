//
//  Not.swift
//  App1256
//
//  Created by IGOR on 14/05/2025.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = true

    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            Image("Not")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Don't miss the important stuff")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 12, weight: .bold))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 3).fill(.black))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                })
                .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
