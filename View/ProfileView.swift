//
//  ProfileView.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Profile View ... ").font(.largeTitle).foregroundStyle(.orange.opacity(0.8))
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.orange.opacity(0.2))
    }
}

#Preview {
    ProfileView()
}
