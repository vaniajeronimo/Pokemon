//
//  PokemonMapper.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

internal extension PokemonResponse {
    func mapToPokemon() -> Pokemon? {
        return Pokemon(abilities: abilities,
                       height: height,
                       id: id,
                       moves: moves,
                       name: name,
                       sprites: sprites,
                       weight: weight,
                       types: types)
    }
}
