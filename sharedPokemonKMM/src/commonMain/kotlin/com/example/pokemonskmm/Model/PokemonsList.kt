package com.example.pokemonskmm.Model

import kotlinx.serialization.Serializable

@Serializable
data class PokemonsList(val results: List<PokemonInListEntity>)

@Serializable
data class PokemonInListEntity(
    val name: String,
    val url: String,
    var pokemon: Pokemon? = null
)