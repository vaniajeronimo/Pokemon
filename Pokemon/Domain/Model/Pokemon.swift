//
//  Pokemon.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

public struct Pokemon: Codable {
    public var abilities: [Abilities]
    public var height: Int
    public var id: Int
    public var name: String
    public var sprites: SpritesDictionaryStruct
    public var weight: Int
    public var types: [Types]
    
    public init(abilities: [Abilities], height: Int, id: Int, name: String, sprites: SpritesDictionaryStruct, weight: Int, types: [Types]) {
        self.abilities = abilities
        self.height = height
        self.id = id
        self.name = name
        self.sprites = sprites
        self.weight = weight
        self.types = types
    }
}
