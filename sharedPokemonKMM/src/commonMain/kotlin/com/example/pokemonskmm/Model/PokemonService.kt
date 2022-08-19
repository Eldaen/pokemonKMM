package com.example.pokemonskmm.Model

import com.example.pokemonskmm.freeze
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

class PokemonService {
    var httpClient = HttpClient()

    suspend fun getPokemon(): Pokemon {
        val pokemon = loadPokemon()
        pokemon.freeze()
        return pokemon
    }

    private suspend fun loadPokemon(): Pokemon {
        val response: HttpResponse = httpClient.get("https://pokeapi.co/api/v2/pokemon/ditto")
        return Json {
            ignoreUnknownKeys = true
        }.decodeFromString<Pokemon>(response.bodyAsText())
    }
}