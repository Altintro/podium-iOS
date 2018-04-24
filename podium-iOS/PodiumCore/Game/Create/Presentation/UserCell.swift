//
//  UserCell.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class UserCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail?.image = nil
    }
    
}

extension UserCell {
    func configureViews() {
       thumbnail.layer.cornerRadius = thumbnail.bounds.width/2
    }
}
