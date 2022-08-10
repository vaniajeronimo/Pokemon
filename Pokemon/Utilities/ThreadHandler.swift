//
//  ThreadHandler.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import Foundation

typealias MethodHandler = () -> Void

func executeInMainThread(_ execution: @escaping MethodHandler, after: Double = 0.0) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
        execution()
    }
}

func executeInBackgroundThread(_ execution: @escaping MethodHandler, after: Double = 0.0) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + after) {
        execution()
    }
}
