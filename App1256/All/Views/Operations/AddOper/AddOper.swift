//
//  AddOper.swift
//  App1256
//
//  Created by IGOR on 03/04/2025.
//

import SwiftUI

struct AddOper: View {
    
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
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.opCat = viewModel.catForAdd
                        viewModel.opType = viewModel.curType
                        
                        viewModel.addOper()
                        
                        viewModel.curType = ""
                        viewModel.catForAdd = ""
                        
                        viewModel.opName = ""
                        viewModel.opSum = ""
                        viewModel.opTag = ""
                        
                        viewModel.fetchOpers()
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                    .opacity(viewModel.curType.isEmpty || viewModel.catForAdd.isEmpty || viewModel.opName.isEmpty || viewModel.opSum.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.curType.isEmpty || viewModel.catForAdd.isEmpty || viewModel.opName.isEmpty || viewModel.opSum.isEmpty ? true : false)
                }
                
                Text("Category")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)

                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.categoriesAdding, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.catForAdd = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.catForAdd == index ? .white : .black)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(6)
                                    .padding(.horizontal, 6)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(viewModel.catForAdd == index ? Color("prim2") : .white).shadow(color: Color("prim2").opacity(0.3), radius: 7))
                            })
                        }
                    }
                    .padding(5)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Name operation")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.opName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.opName)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        Text("Sum")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.opSum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.opSum)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("prim2"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 6)
                        
                        Text("Date and time")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DatePicker("",selection: $viewModel.opDate, displayedComponents: .date)
                            .labelsHidden()
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                            .padding(9)
                        
                        Text("Type")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.curType == index ? .white : .black)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .padding(6)
                                        .padding(.horizontal, 6)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(viewModel.curType == index ? Color("prim2") : .white).shadow(color: Color("prim2").opacity(0.3), radius: 7))
                                })
                            }
                        }
                        .padding(5)
                        
                        Text("Tags")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter tags")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.opTag.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.opTag)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
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
    AddOper(viewModel: HomeViewModel())
}
