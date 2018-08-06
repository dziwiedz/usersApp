//
//  ErrorPresenter.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//
import UIKit

protocol ErrorPresenter {
    func presentErrorAlert(message: String, title: String, okAction: (() -> Void)?)
}

extension ErrorPresenter where Self : UIViewController {
    func presentErrorAlert(message: String, title: String, okAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            guard let okAction = okAction else { return }
            okAction()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
