//
//  ContentView.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        if status {
            
            HomeView()
            
        } else {
            
            R1()
        }
    }
}

#Preview {
    ContentView()
}
