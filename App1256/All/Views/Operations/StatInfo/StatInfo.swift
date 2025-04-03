//
//  StatInfo.swift
//  App1256
//
//  Created by IGOR on 03/04/2025.
//

import SwiftUI

struct StatInfo: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router

    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), Color("prim2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Image(viewModel.curStat)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text(viewModel.curStat)
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                        
                        if viewModel.curStat == "Plan your budget" {
                            
                            Text("Regular budget planning helps to better control finances. Divide income into mandatory expenses (housing, food), savings, and personal expenses. This will avoid unexpected debts and ensure financial stability.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                        } else if viewModel.curStat == "Use non-cash payments" {
                            
                            Text("Modern banking technologies make it possible to conduct most operations online, from paying for utilities to online purchases. It is convenient and fast, and most importantly, it reduces the risk of losing cash. In addition, many banks offer cashback and bonuses for using cards.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                        } else if viewModel.curStat == "Keep an eye on commissions" {
                            
                            Text("When making money transfers, it is important to take into account the fees. Some banks charge high interest rates for transfers between accounts of different banks or for international transactions. Study the terms and conditions before making large transactions to minimize costs.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                        } else if viewModel.curStat == "Check statements regularly" {
                            
                            Text("Checking bank statements allows you to detect errors or suspicious charges in time. This is especially true in the era of cyberbullying. Regular account monitoring will help protect your money and respond promptly to possible problems.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                        } else {
                            
                            Text("If you have available funds, consider investing. It is important to choose reliable instruments that match your risk level. For example, government bonds are considered less risky than shares of private companies. But remember that any investment requires careful analysis and consultations with professionals.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 17, weight: .semibold))
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 13).fill(.white))
                        })
                        .padding(.top, 30)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    StatInfo(viewModel: HomeViewModel())
}
