//
//  TabNavegationDemo.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct TabNavigationDemo: View {
    @State var searchState = ""
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Home()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }

            Tab("Profile", systemImage: "person") {
                ProfileView()
            }
            Tab(role: .search) {
                NavigationStack {
                    Text("Search Content")
                }
                .searchable(text: $searchState)
            }
        }

        //        .tabViewBottomAccessory(){
        //            Text("new item").onTapGesture {
        //
        //            }
        //        }
    }
}

#Preview {
    TabNavigationDemo()
}
