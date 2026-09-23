//
//  ContentView.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) var router
    var body: some View {
        VStack {
            Button("Home"){
                router.navigateToHome()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
