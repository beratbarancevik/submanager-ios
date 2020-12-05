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
        viewModel.updatedSubscriptionViewModel = subscriptionViewModel.copy()
    }
    
    convenience init(subscriptionTypeViewModel: SubscriptionTypeViewModel) {
        self.init()
        viewModel.subscriptionTypeViewModel = subscriptionTypeViewModel
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
        
        if !viewModel.isCreateSubscription {
            dismissBarButtonItem.accessibilityLabel = "dismiss".localized
            dismissBarButtonItem.target = self
            navigationItem.leftBarButtonItem = dismissBarButtonItem
        }
        
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
        
        viewModel.didCreateSubscription.subscribe { [weak self] _ in
            NotificationCenter.default.post(name: Notifications.shouldUpdateSubscriptions.name, object: nil)
            self?.dismiss(animated: true)
        }.disposed(by: disposeBag)
        
        viewModel.didUpdateSubscription.subscribe { [weak self] _ in
            NotificationCenter.default.post(name: Notifications.shouldUpdateSubscriptions.name, object: nil)
            self?.dismiss(animated: true)
        }.disposed(by: disposeBag)
        
        viewModel.error.subscribe { [weak self] event in
            self?.showError(event.error)
        }.disposed(by: disposeBag)
        
        viewModel.loading.subscribe { _ in
        }.disposed(by: disposeBag)
    }
    
    @objc private func dismissDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func saveDidTap() {
        viewModel.saveSubscription()
    }
}

// MARK: - Private Functions
private extension SubscriptionDetailController {
    func openImagePicker() {
        let imagePickerController = PhotoLibraryManager().getImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func manageImageResult(for image: UIImage) {
        // TODO: set image
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SubscriptionDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTextFieldCell.identifier, for: indexPath) as? TitleTextFieldCell else { return UITableViewCell() }
        cell.delegate = self
        let type = viewModel.details[indexPath.row]
        switch type {
        case .title:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.title)
        case .description:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.description)
        case .price:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.priceDescription)
        case .startDate:
            cell.updateUI(type, text: viewModel.subscriptionViewModel?.startDateDescription)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SubscriptionDetailHeaderView.identifier) as? SubscriptionDetailHeaderView else { return UITableViewHeaderFooterView() }
        headerView.delegate = self
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

// MARK: - SubscriptionDetailHeaderViewDelegate
extension SubscriptionDetailController: SubscriptionDetailHeaderViewDelegate {
    func imageViewDidTap() {
        if viewModel.subscriptionTypeViewModel?.isCustomSubscription ?? false {
            openImagePicker()
        }
    }
}

// MARK: - TitleTextFieldCellDelegate
extension SubscriptionDetailController: TitleTextFieldCellDelegate {
    func textFieldDidChange(_ type: SubscriptionDetailType, _ text: String) {
        switch type {
        case .title:
            viewModel.updatedSubscriptionViewModel?.updateTitle(text)
        case .description:
            viewModel.updatedSubscriptionViewModel?.updateDescription(text)
        case .price:
            viewModel.updatedSubscriptionViewModel?.updatePrice(text)
        case .startDate:
            viewModel.updatedSubscriptionViewModel?.updateStartDate(text)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension SubscriptionDetailController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            manageImageResult(for: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            manageImageResult(for: originalImage)
        } else if let originalImage = info[.cropRect] as? UIImage {
            manageImageResult(for: originalImage)
        } else {
            showError()
        }
        dismiss(animated: true)
    }
}
