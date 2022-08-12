//
//  Moves.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation

public struct Moves: Codable {
    public var move: MovesDictionaryStruct
    
    public init(move: MovesDictionaryStruct) {
        self.move = move
    }
}

public struct MovesDictionaryStruct: Codable {
    public var name: String
    public var url: String
    
    public init(dict: [String: String]) {
        self.name = dict.keys.first ?? ""
        self.url = dict.values.first ?? ""
    }
}
