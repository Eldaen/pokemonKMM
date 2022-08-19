package com.example.pokemonskmm.Model

import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

class PokemonService {
    var httpClient = HttpClient()

    private val json = Json {
        ignoreUnknownKeys = true
    }

    suspend fun getPokemon(url: String): Pokemon {
        val response: HttpResponse = httpClient.get(url)
        return json.decodeFromString<Pokemon>(response.bodyAsText())
    }

    suspend fun getPokemons(): PokemonsList {
        val response: HttpResponse = httpClient.get("https://pokeapi.co/api/v2/pokemon/?limit=100")
        return json.decodeFromString<PokemonsList>(response.bodyAsText())
    }
}