//
//  SearchView.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Search View ... ").font(.largeTitle).foregroundStyle(.green.opacity(0.8))
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.green.opacity(0.2))
    }
}

#Preview {
    SearchView()
}
