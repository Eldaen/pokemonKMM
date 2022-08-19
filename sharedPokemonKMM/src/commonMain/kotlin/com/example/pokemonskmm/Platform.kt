package com.example.pokemonskmm

expect class Platform() {
    val platform: String
}

expect fun dafuq()

expect fun <T> T.freeze(): T