//
//  SectionHeaderView.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    
    // MARK: > Properties
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 17.0, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
  
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: Strings.sectionReuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: > Setup Methods
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}

