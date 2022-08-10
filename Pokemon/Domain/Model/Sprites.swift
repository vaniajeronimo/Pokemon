//
//  Sprites.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Sprites: Codable {
    public var sprites: [String: String]
    public var other: Other
    public var versions: Versions
    
    public init(sprites: [String: String], other: Other, versions: Versions) {
        self.sprites = sprites
        self.other = other
        self.versions = versions
    }
}
