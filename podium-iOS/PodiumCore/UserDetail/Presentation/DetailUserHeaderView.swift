//
//  DetailHeaderView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailUserHeaderView: UIView, NibLoadableView {
    private enum Constants {
        static let height: CGFloat = 120
    }
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
}
