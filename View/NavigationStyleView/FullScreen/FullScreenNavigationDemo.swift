//
//  FullScreenNavigationDemo.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct FullScreenNavigationDemo: View {
    @Environment(Router.self) var router
    var body: some View {
        NavigationContent(title:"FullScreen", color: .black){
            VStack{
                Button("Go Home"){
                    router.navigateToHome()
                }
            }
        }
    }
}

#Preview {
    FullScreenNavigationDemo().environment(Router())
}
