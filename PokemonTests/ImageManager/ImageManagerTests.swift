//
//  ImageManagerTests.swift
//  PokemonTests
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation
import XCTest
import Nimble

@testable import Pokemon

class ImageManagerTests: XCTestCase {
    var manager = ImageManager()
    var url = "https://pokeapi.co/api/v2/pokemon/pikachu"
    var imageView = UIImageView(frame: .zero)
        
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_FetchPokemon() {
        expect(self.manager.fetchImage(with: self.url, and: self.imageView)).toNot(beNil())
    }
}
