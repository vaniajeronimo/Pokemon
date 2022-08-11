//
//  DetailsViewControllerTests.swift
//  PokemonTests
//
//  Created by Jeronimo, Vania Aguiar on 11/08/2022.
//

import Foundation
import XCTest
import Nimble

@testable import Pokemon

class DetailsViewControllerTests: XCTestCase {

    var viewController = DetailsViewController()
    
    override func setUp() {
        super.setUp()
        let viewModel = DetailsViewModel()
        viewController.viewModel = viewModel
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)
    }
    
    override func tearDown() {
        super.tearDown()
        viewController.viewWillDisappear(true)
        viewController.viewDidDisappear(true)
    }
    
    func testBindViewModel() {
        expect(self.viewController.viewModel).toNot(beNil())
    }
    
    func testImageView_mainView() {
        expect(self.viewController.tableView).toNot(beNil())
    }
}
