//
//  Home.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import Foundation

public struct Home: Codable {
    public var home: [String: String]
    
    public init(home: [String: String]) {
        self.home = home
    }
}
