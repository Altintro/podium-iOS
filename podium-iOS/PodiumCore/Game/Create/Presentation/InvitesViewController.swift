//
//  InvitesViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class InvitesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: InvitesPresenter
    
    var items: [User] {
        get { return _items.value}
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<User> {
        return tableView.rx.modelSelected(User.self)
    }
    
    let disposeBag = DisposeBag()
    
    private let _items = Variable<[User]>([])
    
    init(presenter: InvitesPresenter){
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.view = self
        presenter.didLoad()
    }
}

extension InvitesViewController: InvitesView {
    func update(with users: [User]) {
       items = users
    }
}

extension InvitesViewController {
    enum Constants {
        static let separatorInset = UIEdgeInsets(top: 0 , left: 32, bottom: 0, right: 0)
        static let rowHeight: CGFloat = 80
    }
    
    func configureTableView() {
        tableView.register(UserCell.self)
        
        tableView.separatorInset = Constants.separatorInset
        tableView.rowHeight = Constants.rowHeight
        
        _items.asObservable()
            .bind(to: tableView.rx.items) { [weak self] tableView, index, item in
                let cell = tableView.dequeueReusableCell(UserCell.self, for: index)
                self?.presenter.present(item: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
}
