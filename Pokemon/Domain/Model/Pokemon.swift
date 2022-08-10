//
//  Pokemon.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

public struct Pokemon: Codable {
    public var height: Int
    public var id: Int
    public var name: String
    public var sprites: Sprites
    public var weight: Int
    
    public init(height: Int, id: Int, name: String, sprites: Sprites, weight: Int) {
        self.height = height
        self.id = id
        self.name = name
        self.sprites = sprites
        self.weight = weight
    }
}
