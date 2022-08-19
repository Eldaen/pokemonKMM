package com.example.pokemonskmm.Model

import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonNames

@Serializable
data class Pokemon(val id: Int, val name: String, val sprites: PokemonImage)

@Serializable
data class PokemonImage(@JsonNames("front_default") val frontDefault: String, val other: PokemonArtwork? = null)

@Serializable
data class PokemonArtwork(@JsonNames("official-artwork") val officialArtwork: PokemonImage)