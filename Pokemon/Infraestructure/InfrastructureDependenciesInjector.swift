//
//  InfrastructureDependenciesInjector.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

class InfrastructureDependenciesInjector {
    
    private init() {}

    static func injectPokemonRepository() -> DomainPokemonRepository {
        return InfraestructurePokemonRepository(pokemonDataProvider: PokemonDataProvider.shared)
    }
}
