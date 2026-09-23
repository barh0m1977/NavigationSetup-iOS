//
//  PushNavegationDemo.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct PushNavigationDemo: View {
    var body: some View {
        NavigationStack{
            NavigationContent(title: "Push", color: .black){
                NavigationLink("Home"){
                    Home()
                }
            }
        }
    }
}

#Preview {
    PushNavigationDemo()
}
