//
//  UIView+Shadow.swift
//  podium-iOS
//
//  Created by Fernando Frances on 17/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow ()  {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
    }
}
