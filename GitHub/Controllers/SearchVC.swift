//
//  SearchVC.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 21/05/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTF = GHTextField(placeHolder: "Enter a Username")
    let callToActionButton = GHButton(backgroundColor: .systemGreen, title: "Get Followers")
    var isUsernameEntered: Bool {
        return !usernameTF.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTF()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTF.text = ""
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGHAlertOnMainThread(title: "Empty Username", message: "Please enter your username. We need to know who to look for 😄.", buttonTitle: "Ok" )
            return
        }
        let followerListVC=FollowerListVC()
        followerListVC.username = usernameTF.text
        followerListVC.title = usernameTF.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTF() {
        view.addSubview(usernameTF)
        usernameTF.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
