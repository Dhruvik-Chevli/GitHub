//
//  UIHelper.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 10/06/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth = width-(2 * padding)-(2 * minimumItemSpacing)
        let itemWidth = availableWidth/3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}

