//
//  Other.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct OtherDictionaryStruct: Codable {
    public var officialArtwork: [String: String]
    
    enum ArtworkCodingKey: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArtworkCodingKey.self)
        self.officialArtwork = try container.decodeIfPresent([String: String].self, forKey: .officialArtwork) ?? [:]
    }
}
