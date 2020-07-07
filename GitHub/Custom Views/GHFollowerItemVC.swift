//
//  GHFollowerItemVC.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 04/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation

protocol GHFollowerItemVCDelegate {
    func didTapGetFollowers(for user: User)
}

class GHFollowerItemVC: GHItemInfoVC {
    
    var delegate: GHFollowerItemVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    init(user: User, delegate: GHFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
