//
//  SportsView.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/28/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SportsView: UIView, NibLoadableView {
    
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let height: CGFloat = 200
    }
    
    var title: String {
        get { return eventTypeLabel.text ?? "" }
        set { eventTypeLabel.text = newValue.uppercased() }
    }
    
    var presenter: SportsPresenter?
    
    var items: [Sport] {
        get { return _items.value }
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<Sport> {
        return collectionView.rx.modelSelected(Sport.self)
    }
    
    let disposeBag = DisposeBag()
    
    private let _items = Variable<[Sport]>([])
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register the cell
        collectionView.register(EventCell.self)
        
        // Bind the items to the collection view data source
        _items.asObservable()
            .bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(EventCell.self, for: index)
                self?.presenter?.present(sport: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
    
}
