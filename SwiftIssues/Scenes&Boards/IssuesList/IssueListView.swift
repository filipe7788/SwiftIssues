import UIKit
import SnapKit

class IssueListView: UIView {
    
    var titleLabel = UILabel()
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: Setup
    private func setup() {
        backgroundColor = .white
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Issues Swift"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.snp_makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
    }

    func remakeTableConstraints() {
        addSubview(tableView)
        tableView.separatorColor = .gray
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 40
        tableView.snp_makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
