package com.example.pokemonskmm

actual class Platform actual constructor() {
    actual val platform: String = "Android ${android.os.Build.VERSION.SDK_INT}"
}

actual  fun dafuq() {

}

actual fun <T> T.freeze(): T = this
