//
//  DetailsDataSource.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import UIKit

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.customCellReuseIdentifier)
                as? CustomTableViewCell else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "ID:"
            cell.valueLabel.text = "\(result?.id ?? 0)"
        case 1:
            cell.titleLabel.text = "Height:"
            cell.valueLabel.text = "\(result?.height ?? 0)"
        case 2:
            cell.titleLabel.text = "Weight:"
            cell.valueLabel.text = "\(result?.weight ?? 0)"
        case 3:
            cell.titleLabel.text = "Type:"
            cell.valueLabel.text = "\(result?.types[safe: 0]?.type.name.capitalized ?? "")"
        case 4:
            cell.titleLabel.text = "Ability:"
            cell.valueLabel.text = "\(result?.abilities[safe: 0]?.ability.name.capitalized ?? "")"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Strings.sectionReuseIdentifier) as? SectionHeaderView else { return nil }
        header.titleLabel.text = "\(result?.name.capitalized ?? "")"
        return header
    }

    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
}
