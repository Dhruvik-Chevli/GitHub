//
//  UITableView+Ext.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 07/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit


extension UITableView {
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
}
