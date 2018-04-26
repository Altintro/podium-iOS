//
//  CustomBackButtonView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 05/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

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
        
        backButton.rx.tap.bind {
            if let parentVC = self.parent as? UINavigationController {
                parentVC.popViewController(animated: true)
            }
        }
    }
    
    func configureCloseButton() {
        let closeButton = UIButton()
        closeButton.imageView?.contentMode = .scaleAspectFit
        closeButton.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
        
        self.view.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint(item: closeButton, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -25)]
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        constraints.append(NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60))
        
        self.view.addConstraints(constraints)
        
        closeButton.rx.tap.bind {
            if let parentVC = self.parent as? UINavigationController {
                parentVC.dismiss(animated: true, completion: nil)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
