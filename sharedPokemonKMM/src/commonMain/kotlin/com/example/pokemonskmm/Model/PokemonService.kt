package com.example.pokemonskmm.Model

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json

class PokemonService {
    var httpClient = HttpClient() {
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
    }

    @Throws(Exception::class)
    suspend fun getPokemon(url: String): Pokemon {
        return httpClient.get(url).body()
    }

    @Throws(Exception::class)
    suspend fun getPokemons(): PokemonsList {
        return httpClient.get("https://pokeapi.co/api/v2/pokemon/?limit=100").body()
    }
}