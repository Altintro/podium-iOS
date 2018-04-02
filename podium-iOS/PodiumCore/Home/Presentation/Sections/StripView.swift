//
//  EventView.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class StripView: UIView, NibLoadableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let height: CGFloat = 220
    }
    
    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
    
    var presenter: StripPresenter?
    
    var items: [StripItem] {
        get { return _items.value }
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<StripItem> {
        return collectionView.rx.modelSelected(StripItem.self)
    }
    
    let disposeBag = DisposeBag()
    
    private let _items = Variable<[StripItem]>([])
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register the cell
        collectionView.register(StripCell.self)
        
        // Bind the items to the collection view data source
        _items.asObservable()
            .bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(StripCell.self, for: index)
                self?.presenter?.present(item: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
    
}

