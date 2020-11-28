//
//  SubscriptionSelectionController.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class SubscriptionSelectionController: BaseController {
    private let viewModel = SubscriptionSelectionViewModel()
    
    // MARK: - UI Properties
    private let dismissBarButtonItem = UIBarButtonItem(image: Images.dismiss.image, style: .plain, target: nil, action: nil)
    private let subscriptionTypesTableView: UITableView = {
        $0.register(SubscriptionCell.self, forCellReuseIdentifier: SubscriptionCell.identifier)
        $0.accessibilityLabel = "subscription_types_table_view".localized
        return $0
    }(UITableView().style(Theme.Table.primary))
    private let refreshControl = UIRefreshControl().style(Theme.RefreshControl.primary)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
        viewModel.getSubscriptionTypes()
    }
}

// MARK: - Setup
extension SubscriptionSelectionController: Setup {
    func setUpUI() {
        view.backgroundColor = .black
        
        navigationController?.navigationBar.accessibilityIdentifier = "subscription_selection_navigation_bar".localized
        
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        dismissBarButtonItem.target = self
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        subscriptionTypesTableView.delegate = self
        subscriptionTypesTableView.dataSource = self
    }
    
    func addViews() {
        view.addSubview(subscriptionTypesTableView)
        subscriptionTypesTableView.addSubview(refreshControl)
    }
    
    func addConstraints() {
        subscriptionTypesTableView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeArea)
        }
    }
    
    func addObservers() {
        viewModel.didReceiveSubscriptionTypes.subscribe { [weak self] _ in
            self?.subscriptionTypesTableView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.error.subscribe { [weak self] event in
            self?.showError(event.error)
        }.disposed(by: disposeBag)
        
        viewModel.loading.subscribe { [weak self] event in
            if event.element ?? false {
                self?.refreshControl.beginRefreshing()
            } else {
                self?.refreshControl.endRefreshing()
            }
        }.disposed(by: disposeBag)
        
        dismissBarButtonItem.action = #selector(dismissDidTap)
        refreshControl.addTarget(self, action: #selector(tableViewDidRefresh), for: .valueChanged)
    }
    
    @objc func tableViewDidRefresh() {
        viewModel.getSubscriptionTypes()
    }
    
    @objc func dismissDidTap() {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SubscriptionSelectionController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(SubscriptionDetailController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.subscriptionTypeViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionCell.identifier, for: indexPath) as? SubscriptionCell else { return UITableViewCell() }
        cell.subscriptionTypeViewModel = viewModel.subscriptionTypeViewModels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
