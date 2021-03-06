//
//  ThumbView.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ThumbView: UIView, NibLoadableView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let height: CGFloat = 130
    }
    
    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
    
    var presenter: ThumbPresenter?
    
    var items: [ThumbItem] {
        get { return _items.value }
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<ThumbItem> {
        return collectionView.rx.modelSelected(ThumbItem.self)
    }
    
    let disposeBag = DisposeBag()
    
    private let _items = Variable<[ThumbItem]>([])
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register the cell
        collectionView.register(ThumbItemCell.self)
        collectionView.backgroundColor = .clear
        
        // Bind the items to the collection view data source
        _items.asObservable()
            .bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(ThumbItemCell.self, for: index)
                self?.presenter?.present(thumbItem: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
    
}
