//
//  PokemonResponse.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

struct PokemonResponse: Codable {
    var abilities: [Abilities]
    var height: Int
    var id: Int
    var moves: [Moves]
    var stats: [Stats]
    var name: String
    var sprites: SpritesDictionaryStruct
    var weight: Int
    var types: [Types]
}
