//
//  PokemonRow.swift
//  iosPokemonKMM
//
//  Created by Денис Сизов on 19.08.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import sharedPokemonKMM

struct PokemonRow: View {
    @EnvironmentObject var pokemonService: PokemonService
    @State var imageUrl: String = ""
    
    var pokemon: PokemonInListEntity
    
    var body: some View {
        HStack {
            Text(pokemon.name)
            Spacer()
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: imageUrl))
                    .frame(width: 40, height: 40)
            }
        }.onAppear {
            loadPokemonDetails()
        }

    }
    
    private func loadPokemonDetails() {
        pokemonService.getPokemon(url: pokemon.url) { pokemon, error in
            if let pokemon = pokemon {
                self.imageUrl = pokemon.sprites.frontDefault
            }
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(pokemon: PokemonInListEntity(name: "Ditto", url: ""))
    }
}
