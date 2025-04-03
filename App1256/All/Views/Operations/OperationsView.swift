//
//  OperationsView.swift
//  App1256
//
//  Created by IGOR on 03/04/2025.
//

import SwiftUI

struct OperationsView: View {
    
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
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.green)
                                .font(.system(size: 18, weight: .medium))
                        })
                        .opacity(viewModel.operations.isEmpty ? 0 : 1)
                        .disabled(viewModel.operations.isEmpty ? true : false)
                    }
                    
                    Text("Operations")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                }
                .padding(.bottom, 20)
                
                Text("It is interesting")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.staties, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.curStat = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    ZStack {
                                        
                                        Image(index)
                                            .resizable()
                                        
                                        VStack {
                                            
                                            Text(index)
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .semibold))
                                                .multilineTextAlignment(.center)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Text("Open")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Spacer()
                                                
                                                Image(systemName: "arrowtriangle.right.fill")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .regular))
                                            }
                                        }
                                        .padding()
                                    }
                                }
                                .frame(width: 180, height: 180)
                                .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                                .padding(9)
                            })
                        }
                    }
                }
                
                Text("Category")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategory = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.currentCategory == index ? .white : .black)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(6)
                                    .padding(.horizontal, 6)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(viewModel.currentCategory == index ? Color("prim2") : .white).shadow(color: Color("prim2").opacity(0.3), radius: 7))
                            })
                        }
                    }
                    .padding(5)
                }
                
                if viewModel.operations.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top, 40)
                        
                        Text("No entries added.")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                        })
                        
                        Spacer()
                    }
                    
                } else {
                    
                    if viewModel.currentCategory == "All" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(spacing: 10) {
                                
                                ForEach(viewModel.operations, id: \.self) { index in
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.opName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text("$\(index.opSum ?? "")")
                                                .foregroundColor(Color("prim2"))
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        HStack {
                                            
                                            Text(index.opCat ?? "")
                                                .foregroundColor(.black.opacity(0.6))
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.opType ?? "")
                                                .foregroundColor(index.opType ?? "" == "Arrival" ? Color.green : Color.red)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            if index.opType ?? "" == "Arrival" {
                                                
                                                Image(systemName: "arrowtriangle.up.fill")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            } else {
                                                
                                                Image(systemName: "arrowtriangle.down.fill")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            Image(systemName: "tag.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.opTag ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .medium))
                                        }
                                        .padding(5)
                                        .padding(.horizontal, 4)
                                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        ZStack {
                                            
                                            Text((index.opDate ?? Date()).convertDate(format: "MMM dd, YYYY"))
                                                .foregroundColor(Color("prim2"))
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedOper = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: "trash.fill")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 16, weight: .regular))
                                            })
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                                    .padding(8)
                                }
                            }
                        }
                        
                    } else {
                        
                        if viewModel.operations.filter({$0.opCat ?? "" == viewModel.currentCategory}).isEmpty {
                            
                            VStack(spacing: 16) {
                                
                                Text("Empty")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.top, 40)
                                
                                Text("No entries added.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAdd = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .medium))
                                })
                                
                                Spacer()
                            }
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack(spacing: 10) {
                                    
                                    ForEach(viewModel.operations.filter({$0.opCat ?? "" == viewModel.currentCategory}), id: \.self) { index in
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Text(index.opName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .semibold))
                                                
                                                Spacer()
                                                
                                                Text("$\(index.opSum ?? "")")
                                                    .foregroundColor(Color("prim2"))
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            
                                            HStack {
                                                
                                                Text(index.opCat ?? "")
                                                    .foregroundColor(.black.opacity(0.6))
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.opType ?? "")
                                                    .foregroundColor(index.opType ?? "" == "Arrival" ? Color.green : Color.red)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                                if index.opType ?? "" == "Arrival" {
                                                    
                                                    Image(systemName: "arrowtriangle.up.fill")
                                                        .foregroundColor(.green)
                                                        .font(.system(size: 14, weight: .regular))
                                                    
                                                } else {
                                                    
                                                    Image(systemName: "arrowtriangle.down.fill")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 14, weight: .regular))
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Image(systemName: "tag.fill")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.opTag ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .medium))
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 4)
                                            .background(RoundedRectangle(cornerRadius: 7).fill(Color("prim")))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                            
                                            ZStack {
                                                
                                                Text((index.opDate ?? Date()).convertDate(format: "MMM dd, YYYY"))
                                                    .foregroundColor(Color("prim2"))
                                                    .font(.system(size: 15, weight: .regular))
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedOper = index
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.isDelete = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: "trash.fill")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                            }
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                                        .padding(8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchOpers()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            StatInfo(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {
                    
                    Text("Delete this operation?")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("It won't be possible to restore")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteOper(withOpName: viewModel.selectedOper?.opName ?? "", completion: {
                            
                            viewModel.fetchOpers()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                        
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                        
                    })
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        )
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOper(viewModel: viewModel)
        })
    }
}

#Preview {
    OperationsView(viewModel: HomeViewModel())
}
