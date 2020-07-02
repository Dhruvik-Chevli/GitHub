//
//  GHItemInfoView.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 03/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class GHItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GHTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GHTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
    }
    
}
