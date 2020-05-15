//
//  IssueCell.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class IssueCell: UITableViewCell {
    var issueTitleLabel = UILabel()
    var issueStateLabel = UILabel()
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupTitleLabel()
        setupStateLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(issueTitleLabel)
        issueTitleLabel.snp_makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().dividedBy(1.3)
        }
    }

    private func setupStateLabel() {
        addSubview(issueStateLabel)
        issueStateLabel.snp_makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(8)
        }
    }
    
    var viewModel: IssueCellViewModel! {
        didSet {
            bindViewModel()
        }
    }
    
    fileprivate func bindViewModel() {
        issueTitleLabel.text = viewModel.issue.title
        issueStateLabel.text = viewModel.issue.state
    }
}
