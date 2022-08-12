//
//  Stats.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation

public struct Stats: Codable {
    public var stat: StatsDictionaryStruct
    
    public init(stat: StatsDictionaryStruct) {
        self.stat = stat
    }
}

public struct StatsDictionaryStruct: Codable {
    public var name: String
    public var url: String
    
    public init(dict: [String: String]) {
        self.name = dict.keys.first ?? ""
        self.url = dict.values.first ?? ""
    }
}
