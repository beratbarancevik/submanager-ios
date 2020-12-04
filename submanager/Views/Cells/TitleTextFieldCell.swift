//
//  TitleTextFieldCell.swift
//  submanager
//
//  Created by Berat Cevik on 11/28/20.
//  Copyright © 2020 Berat Baran Cevik. All rights reserved.
//

import UIKit

protocol TitleTextFieldCellDelegate: AnyObject {
    func textFieldDidChange(_ type: SubscriptionDetailType, _ text: String)
}

class TitleTextFieldCell: BaseTableCell {
    // MARK: - UI Properties
    private let titleLabel = UILabel().style(Theme.Label.Regular.primary)
    private let textField: UITextField = {
        $0.textAlignment = .right
        return $0
    }(UITextField().style(Theme.TextField.primary))
    
    // MARK: - Other Properties
    weak var delegate: TitleTextFieldCellDelegate?
    
    var subsriptionDetailType = SubscriptionDetailType.title
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
        addViews()
        addConstraints()
        addObservers()
    }
    
    // MARK: - Functions
    func updateUI(_ type: SubscriptionDetailType, text: String?) {
        subsriptionDetailType = type
        
        titleLabel.text = type.name.localized
        textField.placeholder = type.placeholder.localized
        textField.text = text
        
        switch type {
        case .title, .description:
            textField.keyboardType = .default
        case .price:
            textField.keyboardType = .decimalPad
        case .startDate:
            textField.keyboardType = .numberPad
        }
    }
}

// MARK: - Setup
extension TitleTextFieldCell: Setup {
    func setUpUI() {
        textField.delegate = self
    }
    
    func addViews() {
        addSubview(titleLabel)
        addSubview(textField)
    }
    
    func addConstraints() {
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(32)
            maker.centerY.equalToSuperview()
            maker.width.equalTo(100)
        }
        
        textField.snp.makeConstraints { maker in
            maker.leading.equalTo(titleLabel.snp.trailing).offset(16)
            maker.trailing.equalToSuperview().inset(32)
            maker.centerY.equalToSuperview()
        }
    }
    
    func addObservers() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.textFieldDidChange(subsriptionDetailType, text)
    }
}

// MARK: - UITextFieldDelegate
extension TitleTextFieldCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard subsriptionDetailType == .startDate else { return true }
        
        guard let text = textField.text else { return true }
        
        // backspace tap
        if string.isEmpty {
            return true
        }
        
        if text.count == 2 || text.count == 5 {
            textField.text?.append("/")
        }
        
        return text.count < 10
    }
}
