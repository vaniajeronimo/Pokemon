//
//  Artwork.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Artwork: Codable {
    public var artwork: [String: String]
    
    public init(artwork: [String: String]) {
        self.artwork = artwork
    }
}
