//
//  GraphView.swift
//  App1256
//
//  Created by IGOR on 03/04/2025.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                router.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.gray)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Cancel")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                    }
                    
                    Text("Graphic")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                }
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 8) {
                        
                        Text("$\(viewModel.balance)")
                            .foregroundColor(.black)
                            .font(.system(size: 26, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                                                    
                            HStack {
                                
                                ForEach(viewModel.periods, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentPer = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currentPer == index ? .white : .black)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 6).fill(viewModel.currentPer == index ? Color("prim2") : .white).shadow(color: Color("prim2").opacity(0.3), radius: 7))
                                    })
                                }
                            }
                            .padding(5)
                        
                        Image("graph")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Statistics")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 9)
                        
                        HStack {
                            
                            Text("Translations")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(Double(.random(in: 1...999))))")                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        HStack {
                            
                            Text("Payment for services")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(Double(.random(in: 1...999))))")                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        HStack {
                            
                            Text("Purchases")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(Double(.random(in: 1...999))))")                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        HStack {
                            
                            Text("Investment")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(Double(.random(in: 1...999))))")                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        HStack {
                            
                            Text("Loans and borrowings")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(Double(.random(in: 1...999))))")
                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom)

                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    GraphView(viewModel: HomeViewModel())
}
