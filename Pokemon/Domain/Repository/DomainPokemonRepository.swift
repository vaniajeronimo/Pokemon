//
//  DomainPokemonRepository.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation
import Alamofire

protocol DomainPokemonRepository {
    func getPokemonData(completion: ((Pokemon?, AFError?) -> ())?)
}
