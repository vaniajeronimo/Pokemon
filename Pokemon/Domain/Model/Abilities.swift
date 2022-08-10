//
//  Abilities.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Abilities: Codable {
    public var ability: AbilityDictionaryStruct
    
    public init(ability: AbilityDictionaryStruct) {
        self.ability = ability
    }
}

public struct AbilityDictionaryStruct: Codable {
    public var name: String
    public var url: String
    
    public init(dict: [String: String]) {
        self.name = dict.keys.first ?? ""
        self.url = dict.values.first ?? ""
    }
}
