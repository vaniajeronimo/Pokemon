//
//  InfraestructurePokemonRepository.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation
import Alamofire

class InfraestructurePokemonRepository: DomainPokemonRepository {
    
    private let pokemonDataProvider: PokemonDataProvider
    
    init(pokemonDataProvider: PokemonDataProvider) {
        self.pokemonDataProvider = pokemonDataProvider
    }
    
    func getPokemonData(completion: ((Pokemon?, AFError?) -> ())?) {
        self.pokemonDataProvider.getPokemon { (result, error) in
            completion?(result, error)
        }
    }
}
