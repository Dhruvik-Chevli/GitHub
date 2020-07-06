//
//  Date+Ext.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 04/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: self)
    }
    
}
