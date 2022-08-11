//
//  PokemonDataProviderTests.swift
//  PokemonTests
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation
import XCTest
import Nimble

@testable import Pokemon

class PokemonDataProviderTests: XCTestCase {
    var dataProvider = PokemonDataProvider()
   
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_getPokemon() {
        expect(self.dataProvider.getPokemon(completion: nil)).toNot(beNil())
    }
}
