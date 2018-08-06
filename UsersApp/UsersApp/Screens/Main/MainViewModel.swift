//
//  MainViewModel.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit
import Domain

protocol MainViewModeling: UITableViewDataSource {
    var failureHandler: ((String) -> Void)? { get set }
    var successHandler: (() -> Void)? { get set }
    
    func fetchData()
    func didTapOnItem(at indexPath: IndexPath)
}

final class MainViewModel: NSObject, MainViewModeling {
    
    //    MARK: - Private properties
    
    private let usersProvider: GetUsersCase
    private let navigator: MainNavigating
    private let imageDownlaoder: ImageDownloading
    private var users: [UserProtocol] = []
    
    //    MARK: - Public properties
    
    var failureHandler: ((String) -> Void)?
    var successHandler: (() -> Void)?
    
    //    MARK: - Public methods
    
    func didTapOnItem(at indexPath: IndexPath) {
        guard indexPath.row < users.count else { return }
        let item = users[indexPath.row]
        navigator.toDetails(of: item)
    }
    
    func fetchData() {
        usersProvider.getUsers { [weak self] (error, users) in
            if let error = error {
                self?.failureHandler?(error.localizedDescription)
                self?.users = []
                return
            }
            else {
                self?.users = (users ?? []).sorted { $0.username.lowercased() < $1.username.lowercased() }
                self?.successHandler?()
            }
        }
    }
    
    //    MARK: - Initializers
    
    init(usersProvider: GetUsersCase,
         navigator: MainNavigating,
         imageDownlaoder: ImageDownloading) {
        self.usersProvider = usersProvider
        self.navigator = navigator
        self.imageDownlaoder = imageDownlaoder
    }
}

extension MainViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier) as! UserCell
        let user = users[indexPath.row]
        cell.configureWith(user: user)
        self.imageDownlaoder.downloadImage(url: URL(string: user.avatarUrl)) { (image, error) in
            DispatchQueue.main.async {
               cell.avatarIamge.image = image
            }
        }
        return cell
    }
    
    
}
