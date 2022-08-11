//
//  CustomTableViewCell.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: > Properties
    
    var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        title.textColor = .systemBlue
        title.numberOfLines = 1
        title.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var valueLabel: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        value.textColor = .black
        value.numberOfLines = 1
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    // MARK: > Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Strings.customCellReuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
    }
    
    // MARK: > SetupLayout
    
    private func setupUI() {
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(20.0)
        }
    }
}
