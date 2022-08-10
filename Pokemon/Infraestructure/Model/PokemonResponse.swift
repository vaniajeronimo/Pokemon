//
//  PokemonResponse.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

struct PokemonResponse: Codable {
    var height: Int
    var id: Int
    var name: String
    var sprites: SpritesDictionaryStruct
    var weight: Int
}
