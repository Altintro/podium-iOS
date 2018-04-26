//
//  Date+Utilities.swift
//  podium-iOS
//
//  Created by Fernando Frances on 26/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

extension Date {
    var year: Int {
        return Calendar.autoupdatingCurrent.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.autoupdatingCurrent.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.autoupdatingCurrent.component(.day, from: self)
    }
    
    var hour: Int {
        return Calendar.autoupdatingCurrent.component(.hour, from: self)
    }
}
