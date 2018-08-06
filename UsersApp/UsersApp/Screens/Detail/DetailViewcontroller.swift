//
//  DetailViewcontroller.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit
import Domain

final class DetailViewController: UIViewController, ErrorPresenter {
    
    //    MARK: - Subviews
    let avatarImage: UIImageView = UIImageView()
    let usernameLabel: UILabel = UILabel()
    let sourceLabel: UILabel = UILabel()
    
    
    //    MARK: - Public properties
    var user: UserProtocol!
    var imageDownloader: ImageDownloading!
    
    //    MARK: - Public methods
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK: - UIViewController life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detais"
        self.view.backgroundColor = .white
        configureSubviews()
        configureLayout()
        configureNavigationController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    //    MARK: - Private methods
    private func setupView() {
        if let url = URL(string: user.avatarUrl) {
            imageDownloader.downloadImage(url: url) { [weak self] (image, error) in
                DispatchQueue.main.async {
                    self?.avatarImage.image = image
                }
            }
        }
        usernameLabel.text = user.username
        sourceLabel.text = user.from.rawValue.uppercased()
    }
    
    private func configureSubviews() {
        view.addSubview(avatarImage)
        view.addSubview(usernameLabel)
        view.addSubview(sourceLabel)
        
        avatarImage.contentMode = .scaleAspectFit
        
        usernameLabel.textColor = UIColor.black
        sourceLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        
        usernameLabel.font = UIFont.systemFont(ofSize: 21)
        sourceLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configureLayout() {
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: [NSLayoutConstraint] = [
            avatarImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            avatarImage.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 16),
            sourceLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            sourceLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureNavigationController() {
        let barButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector (DetailViewController.pop))
        barButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = barButton
    }
}
