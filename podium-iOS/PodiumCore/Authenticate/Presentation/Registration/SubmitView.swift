//
//  SubmitView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 31/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class SubmitView: UIView, NibLoadableView {
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func awakeFromNib() {
        configureViews()
    }
}

private extension SubmitView {
    func configureViews() {
        submitButton.layer.cornerRadius = 5
        submitButton.addShadow()
    }
}
