//
//  DreamWorld.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct DreamWorld: Codable {
    public var dream_world: [String: String]
    
    public init(dream_world: [String: String]) {
        self.dream_world = dream_world
    }
}
