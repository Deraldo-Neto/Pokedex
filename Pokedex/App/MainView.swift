//
//  MainView.swift
//  Pokedex
//
//  Created by Deraldo on 15/03/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.fill.text.grid.1x2")
                    Text("List")
                }
            IVView()
                .tabItem {
                    Image(systemName: "function")
                    Text("IV Calculator")
                }
        } //: TAB
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
