//
//  GHAlertContainerView.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 07/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class GHAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
    
}
