//
//  HomeController.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

class HomeController: BaseController {
    private let viewModel = HomeViewModel()
    
    // MARK: - UI Properties
    private let settingsBarButtonItem = UIBarButtonItem(image: Images.moreHorizontal.image, style: .plain, target: nil, action: nil)
    private let addBarButtonItem = UIBarButtonItem(image: Images.add.image, style: .plain, target: nil, action: nil)
    private let subscriptionsTableView: UITableView = {
        $0.register(SubscriptionCell.self, forCellReuseIdentifier: SubscriptionCell.identifier)
        $0.accessibilityLabel = "home_subscriptions_table_view".localized
        return $0
    }(UITableView().style(Theme.Table.primary))
    private let refreshControl = UIRefreshControl().style(Theme.RefreshControl.primary)
    private let zeroView = ZeroView(labelText: "You don't have any subscriptions. Let's start by adding your first one.", buttonTitle: "Add Subscription")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
        viewModel.getSubscriptions()
    }
}

// MARK: - Setup
extension HomeController: Setup {
    func setUpUI() {
        navigationController?.navigationBar.accessibilityIdentifier = "home_navigation_bar".localized
        navigationItem.title = "home_title".localized
        
        settingsBarButtonItem.target = self
        settingsBarButtonItem.accessibilityLabel = "settings".localized
        navigationItem.leftBarButtonItem = settingsBarButtonItem
        
        addBarButtonItem.target = self
        addBarButtonItem.accessibilityLabel = "add".localized
        navigationItem.rightBarButtonItem = addBarButtonItem
        
        subscriptionsTableView.delegate = self
        subscriptionsTableView.dataSource = self
    }
    
    func addViews() {
        view.addSubview(subscriptionsTableView)
        subscriptionsTableView.addSubview(refreshControl)
        view.addSubview(zeroView)
    }
    
    func addConstraints() {
        subscriptionsTableView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeArea)
        }
        
        zeroView.snp.makeConstraints { maker in
            maker.leading.trailing.equalTo(safeArea).inset(32)
            maker.bottom.equalTo(safeArea.snp.centerY)
        }
    }
    
    func addObservers() {
        viewModel.didReceiveSubscriptions.subscribe { [weak self] _ in
            self?.updateTable()
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
        
        settingsBarButtonItem.action = #selector(settingsDidTap)
        addBarButtonItem.action = #selector(addDidTap)
        refreshControl.addTarget(self, action: #selector(tableViewDidRefresh), for: .valueChanged)
        
        zeroView.mainButtonDidTap = { [weak self] in
            self?.addDidTap()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(shouldUpdateNotifications), name: Notifications.shouldUpdateSubscriptions.name, object: nil)
    }
    
    @objc private func settingsDidTap() {
        present(BaseNavigationController(rootViewController: SettingsController()), animated: true)
    }
    
    @objc private func addDidTap() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        present(BaseNavigationController(rootViewController: SubscriptionSelectionController()), animated: true)
    }
    
    @objc private func tableViewDidRefresh() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        viewModel.getSubscriptions()
    }
    
    @objc private func shouldUpdateNotifications() {
        viewModel.getSubscriptions()
    }
}

// MARK: - Private Functions
private extension HomeController {
    func updateTable() {
        let subscriptionsEmpty = viewModel.subscriptionViewModels.isEmpty
        subscriptionsTableView.setHidden(subscriptionsEmpty)
        zeroView.setHidden(!subscriptionsEmpty)
        subscriptionsTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        present(BaseNavigationController(rootViewController: SubscriptionDetailController(subscriptionViewModel: viewModel.subscriptionViewModels[indexPath.row])), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.subscriptionViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionCell.identifier, for: indexPath) as? SubscriptionCell else { return UITableViewCell() }
        cell.subscriptionViewModel = viewModel.subscriptionViewModels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteSubscription(at: indexPath.row)
        }
    }
}
