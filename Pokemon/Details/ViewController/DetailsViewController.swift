//
//  DetailsViewController.swift
//  Pokemon
//
//  Created by Jeronimo, Vania Aguiar on 10/08/2022.
//

import UIKit
import Combine
import SnapKit

class DetailsViewController: UIViewController {
    
    // MARK: > Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: DetailsViewModel = {
        let viewModel = DetailsViewModel()
        return viewModel
    }()
    
    var result: Pokemon?
    
    // MARK: > Cancellables
    
    private var cancellables: Set<AnyCancellable> = []

    // MARK: > LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        registerCells()
    }
    
    // MARK: > Setup Methods
    
    private func setupUI() {
        fetchImage(with: result?.sprites.other.officialArtwork.first?.value ?? "")
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func registerCells() {
        tableView.register(UINib(nibName: Strings.sectionReuseIdentifier, bundle: nil),
                           forHeaderFooterViewReuseIdentifier: Strings.sectionReuseIdentifier)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Strings.customCellReuseIdentifier.self)
    }
    
    // MARK: > FetchData Methods
    
    private func fetchImage(with url: String = "") {
        ImageManager.shared.fetchImage(with: url, and: self.imageView)
    }
    
    // MARK: > BindViewModel
    
    private func bindViewModel() { }
}


extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
