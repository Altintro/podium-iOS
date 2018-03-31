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
        submitButton.layer.borderWidth = 1.0
        submitButton.layer.cornerRadius = 5.0
        submitButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}
