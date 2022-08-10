//
//  Types.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Types: Codable {
    public var type: TypeDictionaryStruct
    
    public init(type: TypeDictionaryStruct) {
        self.type = type
    }
}

public struct TypeDictionaryStruct: Codable {
    public var name: String
    public var url: String
    
    public init(dict: [String: String]) {
        self.name = dict.keys.first ?? ""
        self.url = dict.values.first ?? ""
    }
}
