//
//  GameCell.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

final class EventCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    
    private(set) var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        eventImageView.image = nil
        disposeBag = DisposeBag()
    }
}
