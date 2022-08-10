//
//  PokemonDataProvider.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation
import Alamofire

enum URL {
    case pikachu
    
    var description: String {
        switch self {
        case .pikachu:
            return "https://pokeapi.co/api/v2/pokemon/pikachu"
        }
    }
}

class PokemonDataProvider {
    
    static let shared = PokemonDataProvider()
    
    func getPokemon(completion: ((Pokemon?, AFError?) -> ())?) {
        let url: String = URL.pikachu.description
        
        AF.request(url).validate().responseDecodable(of: PokemonResponse.self) { (response) in
            switch response.result {
            case .success:
                completion?(response.value?.mapToPokemon() ?? nil, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
