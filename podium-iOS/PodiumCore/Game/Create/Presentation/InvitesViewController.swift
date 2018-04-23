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
    @IBOutlet weak var continueButton: UIButton!
    
    private let presenter: InvitesPresenter
    
    weak var delegate: CreateSectionDelegate?
    
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
        configureViews()
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
        static let rowHeight: CGFloat = 80
    }
    
    func configureTableView() {
        tableView.register(UserCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = Constants.rowHeight
        
        _items.asObservable()
            .bind(to: tableView.rx.items) { [weak self] tableView, index, item in
                let cell = tableView.dequeueReusableCell(UserCell.self, for: index)
                self?.presenter.present(item: item, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    func configureViews() {
        continueButton.layer.cornerRadius = 5
        continueButton.addShadow()
        continueButton.rx.tap.bind {
            self.delegate?.showNext(current: .invite)
        }
    }
}
