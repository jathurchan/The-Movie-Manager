//
//  UIViewController+Extension.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 23/04/2021.
//

import UIKit

extension UIViewController {
    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        TMDBClient.logout {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
