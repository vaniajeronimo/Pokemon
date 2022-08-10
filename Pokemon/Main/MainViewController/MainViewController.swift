//
//  MainViewController.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 09/08/2022.
//

import UIKit
import Combine
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: > Properties
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    lazy var viewModel: MainViewModel = {
        let viewModel = MainViewModel()
        return viewModel
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.pokemonNameLabel
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var detailsButton: UIButton = {
        let detailsBtn = UIButton()
        detailsBtn.setTitle(Strings.buttonTitle, for: .normal)
        detailsBtn.setTitleColor(.white, for: .normal)
        detailsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        detailsBtn.backgroundColor = UIColor.tintColor
        detailsBtn.layer.cornerRadius = 12.0
        detailsBtn.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return detailsBtn
    }()
    
    // MARK: > Cancellables
    
    private var cancellables: Set<AnyCancellable> = []
    
    var result: Pokemon?

    // MARK: > LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
        bindViewModel()
    }
    
    // MARK: > Setup Methods
    
    private func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(underlineView)
        view.addSubview(detailsButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(50.0)
        }
        
        underlineView.snp.makeConstraints { make in
            make.height.equalTo(2.0)
            make.leading.trailing.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(10.0)
        }
        
        detailsButton.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.leading.trailing.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(50.0)
        }
    }
    
    // MARK: > FetchData Methods
    
    private func fetchData() {
        viewModel.fetchPokemon()
    }
    
    private func fetchImage(with url: String = "") {
        ImageManager.shared.fetchImage(with: url, and: self.imageView)
    }
    
    // MARK: > BindViewModel
    
    private func bindViewModel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        viewModel.$pokemon.sink { [weak self] (result) in
            guard let self = self,
                  let imageUrl = result?.sprites.other.officialArtwork.first?.value
            else { return }
            self.result = result
            self.nameLabel.text = result?.name.uppercased()
            self.fetchImage(with: imageUrl)
        }.store(in: &cancellables)
        
        viewModel.$errorMessage.sink { [weak self] (error) in
            guard let self = self else { return }
            if error != "" {
                self.showAlert(with: error?.description ?? Strings.alertMessage)
            }
        }.store(in: &cancellables)
    }
    
    // MARK: > Actions
    
    @objc private func showDetails() {
        let storyboard: UIStoryboard = UIStoryboard(name: Strings.storyboardName, bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: Strings.storyboardIdentifier) as? DetailsViewController {
            detailsVC.result = result
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

// MARK: > Alerts

extension MainViewController {
    private func showAlert(with message: String = "") {
        let alert = UIAlertController(title: Strings.alertTitle, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Strings.alertConfirmation, style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

