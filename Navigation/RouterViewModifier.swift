//
//  RouterViewModifier.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//
import Foundation
import SwiftUI

struct RouterViewModifier :ViewModifier{
    @State private var router = Router()
    
    private func routeView (for route : Route) -> some View {
        Group{
            switch route {
            case .Home:
                Home()
            case .search:
                SearchView()
            case .Profile:
                ProfileView()
            }
        }
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path){
            content
                .environment(router)
                .navigationDestination(for: Route.self){route in
                    routeView(for:  route)
                }
        }
    }
    
}

extension View {
    func withRouter()-> some View {
        modifier(RouterViewModifier())
    }
}
