//
//  HomeView.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Home")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .font(.system(size: 18, weight: .medium))
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .opacity(viewModel.operations.isEmpty ? 0 : 1)
                    .disabled(viewModel.operations.isEmpty ? true : false)
                 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEdit = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                }
                .padding(.bottom, 10)
                
                Text("More")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 14) {
                            
                            Text("Rate app")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                        
                    })

                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/12149a55-dc3d-49e6-9a82-6d15f6f83139") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 14) {
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Image(systemName: "shield.fill")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                        
                    })
                }
                
                HStack {

                        VStack(spacing: 14) {
                            
                            Text(viewModel.name)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.bottom)
                            
                            Text("$\(viewModel.balance)")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 22, weight: .bold))
                            
                            HStack {
                                
                                Text("Weekly profit")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .medium))
                                
                                Spacer()
                                
                                Text("\(viewModel.wprof)%")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .medium))
                                
                                if viewModel.wprof > 0 {
                                    
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(.green)
                                        .font(.system(size: 10, weight: .regular))
                                    
                                } else {
                                    
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 10, weight: .regular))
                                }
                            }
                            
                            HStack {
                                
                                Text("Month profit")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .medium))
                                
                                Spacer()
                                
                                Text("\(viewModel.mprof)%")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .medium))
                                
                                if viewModel.mprof > 0 {
                                    
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(.green)
                                        .font(.system(size: 10, weight: .regular))
                                    
                                } else {
                                    
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 10, weight: .regular))
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 160)
                        .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                        
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isGraph = true
                        }
                        
                    }, label: {
                        
                        VStack(spacing: 14) {
                            
                            Text("Graphic")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.bottom)
                            
                            Image("grap")
                                .resizable()

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
                        .frame(maxWidth: .infinity)
                        .frame(height: 160)
                        .background(RoundedRectangle(cornerRadius: 18).fill(.white).shadow(color: Color("prim2").opacity(0.4), radius: 9))
                        
                    })
                }
                
                Text("Category")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
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
                
                HStack {
                    
                    Text("Operations")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isOperations = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "arrowtriangle.right.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                        
                    })
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
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOper(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditProfile(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            GraphView(viewModel: viewModel)
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
        .sheet(isPresented: $viewModel.isOperations, content: {
            
            OperationsView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
