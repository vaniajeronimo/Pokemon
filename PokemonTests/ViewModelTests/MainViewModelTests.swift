//
//  MainViewModelTests.swift
//  PokemonTests
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation
import XCTest
import Nimble

@testable import Pokemon

class MainViewModelTests: XCTestCase {
    var pokemon: Pokemon?
    var viewModel: MainViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = MainViewModel()
    }
    
    override func tearDown() {
        pokemon = nil
        super.tearDown()
    }
    
    func test_FetchPokemon() {
        expect(self.viewModel.fetchPokemon).toNot(beNil())
    }
    
    func test_errorMessage() {
        expect(self.viewModel.errorMessage).to(beEmpty())
    }
}

