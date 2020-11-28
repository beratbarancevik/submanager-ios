//
//  SubscriptionDetailController.swift
//  submanager
//
//  Created by Berat Cevik on 11/15/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import RxSwift
import UIKit

class SubscriptionDetailController: BaseController {
    private let viewModel = SubscriptionDetailViewModel()
    
    // MARK: - UI Properties
    private let dismissBarButtonItem = UIBarButtonItem(image: Images.dismiss.image, style: .plain, target: nil, action: nil)
    private let saveBarButtonItem = UIBarButtonItem(title: "save".localized, style: .plain, target: nil, action: nil)
    private let detailsTableView: UITableView = {
        $0.register(SubscriptionDetailHeaderView.self, forHeaderFooterViewReuseIdentifier: SubscriptionDetailHeaderView.identifier)
        $0.register(TitleTextFieldCell.self, forCellReuseIdentifier: TitleTextFieldCell.identifier)
        $0.accessibilityLabel = "subscription_detail_table_view".localized
        return $0
    }(UITableView(frame: .zero, style: .grouped).style(Theme.Table.primary))
    
    // MARK: - Init
    convenience init(subscriptionViewModel: SubscriptionViewModel) {
        self.init()
        viewModel.subscriptionViewModel = subscriptionViewModel
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
        registerKeyboardListener()
    }
}

// MARK: - Setup
extension SubscriptionDetailController: Setup {
    func setUpUI() {
        navigationController?.navigationBar.accessibilityIdentifier = "subscription_detail_navigation_bar".localized
        navigationItem.title = "subscription".localized
        
        dismissBarButtonItem.accessibilityLabel = "dismiss".localized
        dismissBarButtonItem.target = self
        navigationItem.leftBarButtonItem = dismissBarButtonItem
        
        saveBarButtonItem.accessibilityLabel = "save".localized
        saveBarButtonItem.target = self
        navigationItem.rightBarButtonItem = saveBarButtonItem
        
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
    
    func addViews() {
        view.addSubview(detailsTableView)
    }
    
    func addConstraints() {
        detailsTableView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeArea)
        }
    }
    
    func addObservers() {
        dismissBarButtonItem.action = #selector(dismissDidTap)
        saveBarButtonItem.action = #selector(saveDidTap)
        
        keyboardHeightDidChange.subscribe { [weak self] event in
            guard let self = self else { return }
            if let keyboardHeight = event.element {
                self.detailsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            }
        }.disposed(by: disposeBag)
    }
    
    @objc func dismissDidTap() {
        dismiss(animated: true)
    }
    
    @objc func saveDidTap() {
        viewModel.saveSubscription()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SubscriptionDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch SettingType.allCases[indexPath.row] {
        case .notifications:
            break
        case .share:
            break
        case .appStore:
            break
        case .systemSettings:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTextFieldCell.identifier, for: indexPath) as? TitleTextFieldCell else { return UITableViewCell() }
        let type = viewModel.details[indexPath.row]
        switch type {
        case .title:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.title)
        case .description:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.description)
        case .price:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.priceDescription)
        case .startDate:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.priceDescription)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = SubscriptionDetailHeaderView(reuseIdentifier: SubscriptionDetailHeaderView.identifier) as? SubscriptionDetailHeaderView else { return UITableViewHeaderFooterView() }
        headerView.imageUrl = viewModel.subscriptionViewModel?.imageUrl
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 192
    }
}
