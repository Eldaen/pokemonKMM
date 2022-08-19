package com.example.pokemonskmm.Model

import kotlinx.serialization.Serializable

@Serializable
data class Pokemon(val id: Int, val name: String) {
}