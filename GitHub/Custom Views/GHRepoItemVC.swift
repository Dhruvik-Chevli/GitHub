//
//  GHRepoItemVC.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 03/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
protocol GHRepoItemVCDelegate {
    func didTapGitHubProfile(for user: User)
    
}

class GHRepoItemVC: GHItemInfoVC {
    var delegate: GHRepoItemVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    init(user: User, delegate: GHRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
