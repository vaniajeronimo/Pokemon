//
//  DetailsDataSource.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import UIKit

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "\(result?.name.uppercased() ?? "")"
        case 1:
            cell.textLabel?.text = "ID: \(result?.id ?? 0)"
        case 2:
           cell.textLabel?.text = "Height: \(result?.height ?? 0)"
        case 3:
            cell.textLabel?.text = "Weight: \(result?.weight ?? 0)"
        case 4:
            cell.textLabel?.text = "Type: \(result?.types[safe: 0]?.type.name.capitalized ?? "")"
        case 5:
            cell.textLabel?.text = "Ability: \(result?.abilities[safe: 0]?.ability.name.capitalized ?? "")"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
}
