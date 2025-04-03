//
//  R1.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim2"), Color("prim")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R!")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Record transactions by category")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                
                                R2()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(colors: [Color("prim2"), Color("prim")], startPoint: .bottom, endPoint: .top)))
                            })
                        }
                        .padding(20)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.black))
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    R1()
}
