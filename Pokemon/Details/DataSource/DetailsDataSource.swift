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
        setupCells(with: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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

extension DetailsViewController {
    private func setupCells(with cell: CustomTableViewCell, for indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = Strings.id + ":"
            cell.valueLabel.text = "\(result?.id ?? 0)"
        case 1:
            cell.titleLabel.text = Strings.height + ":"
            cell.valueLabel.text = "\(result?.height ?? 0)"
        case 2:
            cell.titleLabel.text = Strings.weight + ":"
            cell.valueLabel.text = "\(result?.weight ?? 0)"
        case 3:
            cell.titleLabel.text = Strings.type + ":"
            cell.valueLabel.text = "\(result?.types[safe: 0]?.type.name.capitalized ?? "")"
        case 4:
            cell.titleLabel.text = Strings.ability + ":"
            cell.valueLabel.text = "\(result?.abilities[safe: 0]?.ability.name.capitalized ?? "")"
        case 5:
            cell.titleLabel.text = Strings.moves + ":"
            cell.valueLabel.text = "\(result?.moves[safe: 0]?.move.name.capitalized ?? "")"
        default:
            break
        }
    }
}
