//
//  Home.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Home View ... ").font(.largeTitle).foregroundStyle(.blue.opacity(0.8))
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.blue.opacity(0.2))
        
    }
}

#Preview {
    Home()
}
