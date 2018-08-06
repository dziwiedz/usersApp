//
//  MainViewController.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, ErrorPresenter {
    
    //    MARK: - Subviews
    let tableView: UITableView = UITableView()
    
    //    MARK: - Public properties
    var viewModel: MainViewModeling?
    
    
    //    MARK: - Public methods
    
    @objc func didReloadData() {
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    @objc func displayError(_ message: String) {
        DispatchQueue.main.async { [unowned self] in
            self.presentErrorAlert(message: message, title: "Error")
        }
    }
    
    //    MARK: - UIViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        configureTableView()
        configureViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.fetchData()
    }
    
    //    MARK: - Private methods
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.separatorStyle = .singleLineEtched
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = viewModel
    }
    
    private func configureViewModel() {
        viewModel?.successHandler = didReloadData
        viewModel?.failureHandler = displayError(_:)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserCell.preferedHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didTapOnItem(at: indexPath)
    }
}
