//
//  DetailGameHeaderView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 26/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailGameHeaderView: UIView, NibLoadableView {
    
    private enum Constants {
        static let height: CGFloat = 246
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overTitle: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
}
