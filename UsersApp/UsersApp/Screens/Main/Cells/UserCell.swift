//
//  UserCell.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit
import Domain

final class UserCell: UITableViewCell {
    
    static let preferedHeight: CGFloat = 66
    
    let usernameLabel: UILabel = UILabel()
    let userSourceLabel: UILabel = UILabel()
    let avatarIamge: UIImageView = UIImageView()
    
    func configureWith(user: UserProtocol) {
        self.usernameLabel.text = user.username
        self.userSourceLabel.text = user.from.rawValue
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarIamge.image = nil
        usernameLabel.text = nil
        userSourceLabel.text = nil
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        contentView.addSubview(usernameLabel)
        contentView.addSubview(userSourceLabel)
        contentView.addSubview(avatarIamge)
        
        usernameLabel.textColor = UIColor.black
        userSourceLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        
        usernameLabel.font = UIFont.systemFont(ofSize: 15)
        userSourceLabel.font = UIFont.systemFont(ofSize: 11)
    }
    
    private func configureLayout() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        userSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarIamge.translatesAutoresizingMaskIntoConstraints = false
        
        self.layoutMargins = UIEdgeInsetsMake(8, 8, 8, 8)
        
        let avatarHeight: CGFloat = 50
        
        let constraints: [NSLayoutConstraint] = [
            avatarIamge.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            avatarIamge.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            avatarIamge.widthAnchor.constraint(equalToConstant: avatarHeight),
            avatarIamge.heightAnchor.constraint(equalToConstant: avatarHeight),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarIamge.trailingAnchor, constant: 8),
            usernameLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            userSourceLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            userSourceLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
