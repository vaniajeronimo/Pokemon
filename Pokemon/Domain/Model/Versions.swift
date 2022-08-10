//
//  Versions.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Versions: Codable {
    public var versions: [[String: String]]
    
    public init(versions: [[String: String]]) {
        self.versions = versions
    }
}
