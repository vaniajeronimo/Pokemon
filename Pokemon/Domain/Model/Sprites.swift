//
//  Sprites.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct SpritesDictionaryStruct: Codable {
    public var back_default: String
    public var front_default: String
    public var other: OtherDictionaryStruct

    public init(dict: [String: String], other: OtherDictionaryStruct) {
        self.back_default = dict.keys.first ?? ""
        self.front_default = dict.values.first ?? ""
        self.other = other
    }
}



