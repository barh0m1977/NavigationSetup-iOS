//
//  NavigationContent.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct NavigationContent<Content: View>: View {
    // 1. Define the properties that you pass in
    let title: String
    let color: Color
    
    // 2. Use @ViewBuilder to accept nested views (like NavigationLink)
    let content: () -> Content

    // 3. Custom initializer to allow the trailing closure syntax
    init(title: String, color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.color = color
        self.content = content
    }

    var body: some View {
        ZStack {
            // Background color fill
            color
                .ignoresSafeArea()
            
            // View layout content
            VStack(spacing: 20) {
                Text("\(title) type of Navigation")
                    .font(.title)
                    .foregroundColor(.white)
                
                // This renders whatever you place inside the NavigationContent { ... } block
                content()
            }
            .padding()
        }
    }
}

#Preview {
    NavigationContent(title: "Basic", color: .cyan){
      Text("")
    }
}
