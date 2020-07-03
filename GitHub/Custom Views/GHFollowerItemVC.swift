//
//  GHFollowerItemVC.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 04/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation

class GHFollowerItemVC: GHItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
