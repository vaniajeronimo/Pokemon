//
//  PokemonDataProvider.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation
import Alamofire

enum EndPoints {
    case pikachu
    case charmander
    case bulbasaur
    case squirtle
    case pidgeot
    case ditto
    case meowth
    
    var description: String {
        switch self {
        case .pikachu:
            return "https://pokeapi.co/api/v2/pokemon/pikachu"
        case .charmander:
            return "https://pokeapi.co/api/v2/pokemon/charmander"
        case .bulbasaur:
            return "https://pokeapi.co/api/v2/pokemon/bulbasaur"
        case .squirtle:
            return "https://pokeapi.co/api/v2/pokemon/squirtle"
        case .pidgeot:
            return "https://pokeapi.co/api/v2/pokemon/pidgeot"
        case .ditto:
           return "https://pokeapi.co/api/v2/pokemon/ditto"
        case .meowth:
            return "https://pokeapi.co/api/v2/pokemon/meowth"
        }
    }
}

class PokemonDataProvider {
    
    static let shared = PokemonDataProvider()
    
    func getPokemon(completion: ((Pokemon?, AFError?) -> ())?) {
        let urls: [String] = [EndPoints.pikachu.description,
                              EndPoints.charmander.description,
                              EndPoints.bulbasaur.description,
                              EndPoints.squirtle.description,
                              EndPoints.ditto.description,
                              EndPoints.meowth.description]
        
        guard let url = urls.randomElement()?.description else { return }
        
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
