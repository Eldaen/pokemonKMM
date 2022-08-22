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
                AsyncImage(url: URL(string: pokemon.pokemon?.sprites.frontDefault ?? ""))
                    .frame(width: 40, height: 40)
            }
        }
    }
    
//    private func loadPokemonDetails() {
//        pokemonService.getPokemon(url: pokemon.url) { pokemon, error in
//            if let pokemon = pokemon {
//                self.imageUrl = pokemon.sprites.frontDefault
//            }
//        }
//    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(id: 0, name: "bulbasaur", sprites: PokemonImage(frontDefault: "", other: nil))
        PokemonRow(pokemon: PokemonInListEntity(name: "bulbasaur", url:"https://pokeapi.co/api/v2/pokemon/1/", pokemon: pokemon))
    }
}
