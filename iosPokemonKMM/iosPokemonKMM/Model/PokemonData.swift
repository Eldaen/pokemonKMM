//
//  PokemonData.swift
//  iosPokemonKMM
//
//  Created by Денис Сизов on 19.08.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import sharedPokemonKMM

class PokemonData: ObservableObject {
    @Published var shared = PokemonService()
}
