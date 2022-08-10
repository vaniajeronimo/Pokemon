//
//  DomainDependenciesInjector.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

class DomainDependenciesInjector {
    private init() {}
    
    static func injectGetPokemon() -> GetPokemonUseCase {
        return GetPokemonUseCase(pokemonRepository: InfrastructureDependenciesInjector.injectPokemonRepository())
    }
}
