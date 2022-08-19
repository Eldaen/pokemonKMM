//
//  PokemonsTable.swift
//  iosPokemonKMM
//
//  Created by Денис Сизов on 19.08.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import sharedPokemonKMM

struct PokemonsTable: View {
    @EnvironmentObject var pokemonService: PokemonService
    
    @State var status: String = "Loading..."
    @State var pokemonCount: Int = 0
    @State var pokemons: PokemonsList? = nil
    
    var body: some View {
        VStack {
            Text("Who's that pokemon?")
                .font(.title2)
            
            if pokemonCount == 0 {
                Text(status)
            } else if let pokemons = pokemons {
                NavigationView {
                    
                    List {
                        ForEach(pokemons.results, id: \.name) { pokemon in
                            NavigationLink {
                                PokemonDetails(pokemon: pokemon)
                            } label: {
                                PokemonRow(pokemon: pokemon)
                            }
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
        }.onAppear {
            loadPokemons()
        }
    }
    
    func loadPokemons() {
        pokemonService.getPokemons { pokemons, error in
            if let pokemons = pokemons {
                self.pokemons = pokemons
                self.pokemonCount = pokemons.results.count
            } else if let _ = error {
                status = "Error.."
            }
        }
    }
}

struct PokemonsTable_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsTable()
    }
}
