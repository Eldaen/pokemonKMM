//
//  PokemonDetails.swift
//  iosPokemonKMM
//
//  Created by Денис Сизов on 19.08.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import sharedPokemonKMM

struct PokemonDetails: View {
    @EnvironmentObject var pokemonService: PokemonService
    @State var pokemon: PokemonInListEntity
    @State var imageUrl: String = ""
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                AsyncImage(
                    url: URL(string: self.imageUrl),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .transition(.scale(scale: 0.1, anchor: .center))
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7)
                            .frame(width: 300, height: 300)
                    case .failure:
                        Image(systemName: "wifi.slash")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            Text(pokemon.name)
                .font(.title2)
        }.onAppear {
            loadPokemon()
        }
    }
    
    private func loadPokemon() {
        pokemonService.getPokemon(url: pokemon.url) { pokemon, error in
            if let pokemon = pokemon {
                if let other = pokemon.sprites.other {
                    self.imageUrl = other.officialArtwork.frontDefault
                } else  {
                    self.imageUrl = pokemon.sprites.frontDefault
                }
            }
        }
    }
}

struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetails(pokemon: PokemonInListEntity(name: "Dafuq", url: ""))
    }
}
