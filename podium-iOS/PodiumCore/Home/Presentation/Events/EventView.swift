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

final class EventView: UIView, NibLoadableView {
    
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private enum Constants {
        static let height: CGFloat = 200
    }
    
    var title: String {
        get { return eventTypeLabel.text ?? "" }
        set { eventTypeLabel.text = newValue.uppercased() }
    }
    
    var presenter: EventsPresenter?
    
    var items: [Game] {
        get { return _items.value }
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<Game> {
        return collectionView.rx.modelSelected(Game.self)
    }
    
    let disposeBag = DisposeBag()
    
    private let _items = Variable<[Game]>([])
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register the cell
        collectionView.register(EventCell.self)
        
        // Bind the items to the collection view data source
        _items.asObservable()
            .bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(EventCell.self, for: index)
                self?.presenter?.present(game: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
    
}
