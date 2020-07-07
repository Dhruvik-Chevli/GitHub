//
//  UIViewController+Ext.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 07/06/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentGHAlertOnMainThread(title: String, message: String, buttonTitle: String)
    {
        DispatchQueue.main.async {
            let alertVC = GHAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
