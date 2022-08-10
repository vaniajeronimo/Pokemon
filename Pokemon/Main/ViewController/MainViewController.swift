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
        let name = UILabel()
        name.text = Strings.pokemonNameLabel
        name.textAlignment = .center
        return name
    }()
    
    lazy var detailsButton: UIButton = {
        let detailsBtn = UIButton()
        detailsBtn.setTitle(Strings.buttonTitle, for: .normal)
        detailsBtn.setTitleColor(UIColor.white, for: .normal)
        detailsBtn.backgroundColor = UIColor.tintColor
        detailsBtn.layer.cornerRadius = 6.0
        detailsBtn.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return detailsBtn
    }()
    
    // MARK: > Cancellables
    
    private var cancellables: Set<AnyCancellable> = []

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
        view.addSubview(detailsButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(30.0)
            make.leading.trailing.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(50.0)
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
        guard let url = URL(string: url) else { return }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            executeInMainThread {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        getDataTask.resume()
    }
    
    // MARK: > BindViewModel
    
    private func bindViewModel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        viewModel.$pokemon.sink { [weak self] (result) in
            guard let self = self,
                  let imageUrl = result?.sprites.other.officialArtwork.first?.value
            else { return }
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
        print(">>> Show Pokemon Details")
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

