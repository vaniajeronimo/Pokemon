//
//  MainViewModel.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Combine

class MainViewModel: ObservableObject {
    
    // MARK: > Properties
    
    @Published var pokemon: Pokemon?
    @Published var errorMessage: String?
    
    init(){
        self.pokemon = nil
        self.errorMessage = ""
    }
    
    // MARK: > FetchData
    
    func fetchPokemon() {
        DomainDependenciesInjector.injectGetPokemon().execute() { (result: Pokemon?, error)  in
            if result != nil, let result = result {
                self.pokemon = result
            } else {
                self.errorMessage = error?.localizedDescription
            }
        }
    }
}
