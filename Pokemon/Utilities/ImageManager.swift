//
//  ImageManager.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    func fetchImage(with url: String = "", and imageView: UIImageView) {
        guard let url = URL(string: url) else { return }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            executeInMainThread {
                let image = UIImage(data: data)
                imageView.image = image
            }
        }
        getDataTask.resume()
    }
}
