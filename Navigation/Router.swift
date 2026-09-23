//
//  Router.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//
import Foundation
import SwiftUI
import Observation
@Observable
class Router {
    // that as manage for stack
    var path = NavigationPath()
    // MARK: - navigate to Search view
    func navigateToSearch(){
        path.append(Route.search)
    }
    // MARK: - navigate to Home view
    func navigateToHome(){
        path.append(Route.Home)
    }
    // MARK: - navigate to profile view
    func navigateToProfile(){
        path.append(Route.Profile)
    }
    // MARK: - pop-up stack
    func popUpStack(){
        path.removeLast(path.count)
    }
}
enum Route : Hashable {
    case search
    case Home
    case Profile
}
