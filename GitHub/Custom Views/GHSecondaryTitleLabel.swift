//
//  GHSecondaryTitleLabel.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 02/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class GHSecondaryTitleLabel: UILabel {

   override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
   }
   
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   
    convenience init(size: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: size, weight: .medium)
        
   }
   
   
   private func configure() {
       textColor = .secondaryLabel
       adjustsFontSizeToFitWidth = true
       minimumScaleFactor = 0.9
       font = UIFont.preferredFont(forTextStyle: .body)
       lineBreakMode = .byTruncatingTail
       translatesAutoresizingMaskIntoConstraints = false
   }

}
