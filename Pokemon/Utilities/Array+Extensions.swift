//
//  Array+Extensions.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

extension MutableCollection {
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}
