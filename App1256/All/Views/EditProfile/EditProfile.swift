//
//  EditProfile.swift
//  App1256
//
//  Created by IGOR on 03/04/2025.
//

import SwiftUI

struct EditProfile: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
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
                    
                    Text("Edit")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.name = viewModel.addname
                        viewModel.balance = viewModel.addbalance
                                                
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Name Surname")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.addname.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addname)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        Text("Current Balance")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.addbalance.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addbalance)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)

                        Text("Weekly Profit")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Text("\(viewModel.wprof)%")
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.wprof += 1
                                
                            }, label: {
                                
                                Image(systemName: "arrowtriangle.up.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 14).fill(.white).shadow(radius: 4))
                                
                            })
                            .padding(4)
                            
                            Button(action: {
                                
                                viewModel.wprof -= 1
                                
                            }, label: {
                                
                                Image(systemName: "arrowtriangle.down.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 14).fill(.white).shadow(radius: 4))
                                
                            })
                            .padding(4)
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        Text("Month Profit")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Text("\(viewModel.mprof)%")
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.mprof += 1
                                
                            }, label: {
                                
                                Image(systemName: "arrowtriangle.up.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 14).fill(.white).shadow(radius: 4))
                                
                            })
                            .padding(4)
                            
                            Button(action: {
                                
                                viewModel.mprof -= 1
                                
                            }, label: {
                                
                                Image(systemName: "arrowtriangle.down.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 14).fill(.white).shadow(radius: 4))
                                
                            })
                            .padding(4)
                        }
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    EditProfile(viewModel: HomeViewModel())
}
