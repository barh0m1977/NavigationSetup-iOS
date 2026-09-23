//
//  SheetNavigationDemo.swift
//  NavigationSetup
//
//  Created by Indexer on 9/22/26.
//

import SwiftUI

struct SheetNavigationDemo: View {
    @State var sheetState : Bool = false
    var body: some View {
        NavigationContent(title: "Sheet", color: .mint){
            Button("sheet",action: {sheetState.toggle()})
        }.sheet(isPresented: $sheetState){
            Home()
                .presentationDetents([.medium,.large])
        }
    }
}

#Preview {
    SheetNavigationDemo()
}
