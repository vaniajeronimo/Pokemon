//
//  GetPokemonUseCase.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation
import Alamofire

class GetPokemonUseCase {
    
    private let pokemonRepository: DomainPokemonRepository
    
    init(pokemonRepository: DomainPokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(completion: ((Pokemon?, AFError?) -> ())?) {
        self.pokemonRepository.getPokemonData(completion: completion)
    }
}
