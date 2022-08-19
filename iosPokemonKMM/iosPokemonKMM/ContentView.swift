import SwiftUI
import sharedPokemonKMM

struct ContentView: View {
    @StateObject var pokemonService = PokemonData()

	var body: some View {
        PokemonsTable()
            .environmentObject(pokemonService)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
