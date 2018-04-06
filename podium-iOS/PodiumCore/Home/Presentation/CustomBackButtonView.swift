//
//  CustomBackButtonView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 05/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol CustomBackButtonView {
    func configureBackButton()
}

extension CustomBackButtonView where Self: UIViewController {
    func configureBackButton() {
        let backButton = UIButton()
        
        backButton.setImage(#imageLiteral(resourceName: "arrowback"), for: .normal)
        
        self.view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint(item: backButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)]
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 30))
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 0, constant: 15))
        
        self.view.addConstraints(constraints)
        
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
}

extension UIViewController {
    @objc func backButtonPressed()  {
        if let parentVC = self.parent as? UINavigationController {
            parentVC.popViewController(animated: true)
        }
    }
}
