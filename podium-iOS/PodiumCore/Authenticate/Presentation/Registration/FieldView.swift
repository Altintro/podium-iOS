//
//  FieldView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class FieldView: UIView, NibLoadableView {
    var type: FieldType? = nil
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textField: UITextField!
}
