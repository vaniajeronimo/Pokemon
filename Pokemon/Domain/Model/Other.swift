//
//  Other.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Other: Codable {
    public var dream_world: [DreamWorld]
    public var home: [Home]
    public var official_artwork: [Artwork]
    
    public init(dream_world: [DreamWorld], home: [Home], official_artwork: [Artwork]) {
        self.dream_world = dream_world
        self.home = home
        self.official_artwork = official_artwork
    }
}
