//
//  StripCell.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift


final class StripCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var thumbnail1: UIImageView!
    @IBOutlet weak var thumbnail2: UIImageView!
    @IBOutlet weak var thumbnail3: UIImageView!
    
    private(set) var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        configureViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Set images to nil when reusing (Try out this!)
        background.subviews.forEach {
            if($0.isKind(of: UIImageView.self)) {
                let iv = $0 as! UIImageView
                iv.image = nil
            }
        }
        disposeBag = DisposeBag()
    }
}

private extension StripCell {
    func configureViews() {
        
        // Background
        background.layer.cornerRadius = 5
        background.addShadow()
        
        // Thumbnails
        background.subviews.forEach {
            if($0.isKind(of: UIImageView.self)) {
                let iv = $0 as! UIImageView
                iv.layer.cornerRadius = iv.bounds.width/2
                iv.layer.borderColor = UIColor.white.cgColor
                iv.layer.borderWidth = 2
            }
        }
    }
}

