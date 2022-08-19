package com.example.pokemonskmm

import platform.UIKit.UIDevice
import kotlin.native.concurrent.freeze

actual fun <T> T.freeze(): T = freeze()

actual fun dafuq() {

}

actual class Platform actual constructor() {
    actual val platform: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}