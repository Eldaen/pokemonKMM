import SwiftUI
import sharedPokemonKMM

struct ContentView: View {
	let pokemonService = PokemonService()
    @State var pokemonName: String = "Loading.."

	var body: some View {
        Text(pokemonName).onAppear {
            load()
        }
	}
    
    func load() {
        pokemonService.getPokemon { pokemon, error in
            if let pokemon = pokemon {
                pokemonName = pokemon.name
            } else if let _ = error {
                pokemonName = "Error.."
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
