//
//  CustomBackButtonView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 05/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol CustomNavigationButtonsView {
    func configureBackButton()
    func configureCloseButton()
}

extension CustomNavigationButtonsView where Self: UIViewController {
    func configureBackButton() {
        let backButton = UIButton()
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.setImage(#imageLiteral(resourceName: "arrowback"), for: .normal)
        
        self.view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false

        
        var constraints = [NSLayoutConstraint(item: backButton, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 15)]
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        constraints.append(NSLayoutConstraint(item: backButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60))
        
        self.view.addConstraints(constraints)
        
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    func configureCloseButton() {
        let closeButton = UIButton()
        closeButton.imageView?.contentMode = .scaleAspectFit
        closeButton.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
        
        self.view.addSubview(closeButton)
        
        var constraints = [NSLayoutConstraint(item: closeButton, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 15)]
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60))
        
        self.view.addConstraints(constraints)
        
        
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
    }
}

extension UIViewController {
    @objc func backButtonPressed()  {
        if let parentVC = self.parent as? UINavigationController {
            parentVC.popViewController(animated: true)
        }
    }
    
    @objc func closeButtonPressed() {
        if let parentVC = self.parent as? UINavigationController {
            parentVC.dismiss(animated: true, completion: nil)
        }
    }
}
