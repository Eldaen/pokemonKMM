package com.example.pokemonskmm.Model

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.serialization.json.Json

class PokemonService {
    private var httpClient = HttpClient() {
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
//        return httpClient.get(url).body()
        val result: Pokemon
        coroutineScope {
            val data: Deferred<Pokemon> = async(Dispatchers.Default) {
                httpClient.get(url).body()
            }
            result = data.await()
        }
        return result
    }

    @Throws(Exception::class)
    suspend fun getPokemons(): PokemonsList {
        val result: PokemonsList

        coroutineScope {
            val data: Deferred<PokemonsList> = async(Dispatchers.Default) {
                httpClient.get("https://pokeapi.co/api/v2/pokemon/?limit=500").body()
            }
            result = data.await()

            for (pokemon in result.results) {
                launch {
                    pokemon.pokemon = httpClient.get(pokemon.url).body()
                }
            }
        }
        return result
    }
}