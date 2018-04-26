//
//  SportCell.swift
//  podium-iOS
//
//  Created by Fernando Frances on 18/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

final class ThumbItemCell: UICollectionViewCell, ReusableView, NibLoadableView{
    
    @IBOutlet weak var imageView: UIImageView!
    
    private(set) var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = imageView.bounds.size.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}

