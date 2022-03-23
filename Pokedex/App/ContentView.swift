//
//  ContentView.swift
//  Pokedex
//
//  Created by Deraldo on 14/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemons = [regionPokemon]()
    
    var body: some View {
        List(pokemons, id: \.url) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
            }
        }
        .task {
            await ApiRegion().getRegionPokemon { (pokemons) in
                self.pokemons = pokemons
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
