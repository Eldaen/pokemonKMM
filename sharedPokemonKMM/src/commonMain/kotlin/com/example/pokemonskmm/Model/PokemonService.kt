package com.example.pokemonskmm.Model

import com.example.pokemonskmm.freeze
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
        val pokemon = loadPokemon(url)
        pokemon.freeze()
        return pokemon
    }

    suspend fun getPokemons(): PokemonsList {
        val pokemons = loadPokemons()
        pokemons.freeze()
        return pokemons
    }

    private suspend fun loadPokemon(url: String): Pokemon {
        val response: HttpResponse = httpClient.get(url)
        return json.decodeFromString<Pokemon>(response.bodyAsText())
    }



    private suspend fun loadPokemons(): PokemonsList {
        val response: HttpResponse = httpClient.get("https://pokeapi.co/api/v2/pokemon/?limit=100")
        return json.decodeFromString<PokemonsList>(response.bodyAsText())
    }
}