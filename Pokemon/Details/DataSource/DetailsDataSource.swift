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
            cell.textLabel?.text = "ID: \(result?.id ?? 0)"
        case 1:
            cell.textLabel?.text = "Height: \(result?.height ?? 0)"
        case 2:
            cell.textLabel?.text = "Weight: \(result?.weight ?? 0)"
        case 3:
            cell.textLabel?.text = "Type: \(result?.types[safe: 0]?.type.name.capitalized ?? "")"
        case 4:
            cell.textLabel?.text = "Ability: \(result?.abilities[safe: 0]?.ability.name.capitalized ?? "")"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Strings.reuseIdentifier) as? SectionHeaderView else { return nil }
        header.titleLabel.text = "\(result?.name.capitalized ?? "")"
        return header
    }

    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}
