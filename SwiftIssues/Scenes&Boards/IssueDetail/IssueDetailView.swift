import UIKit
import SnapKit

class IssueDetailView: UIView {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var userAvatarImageView = UIImageView()
    var userNameLabel = UILabel()
    var createdLabel = UILabel()
    var goToIssueButton = UIButton(type: .system)
    var backButton = UIButton(type: .system)
    
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
        setupBackButton()
        setupAvatarImageView()
        setupUserNameLabel()
        setupGoToIssueButton()
        setupTitleLabel()
        setupCreatedLabel()
        setupDescriptionLabel()
    }
    
    private func setupBackButton() {
        addSubview(backButton)
        backButton.setTitle("Voltar", for: .normal)
        backButton.snp_makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(70)
        }
    }
    
    private func setupAvatarImageView() {
        addSubview(userAvatarImageView)
        userAvatarImageView.layer.cornerRadius = 50
        userAvatarImageView.contentMode = .scaleAspectFit
        userAvatarImageView.snp_makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(100)
        }
    }
    
    private func setupUserNameLabel() {
        addSubview(userNameLabel)
        userNameLabel.snp_makeConstraints { make in
            make.top.equalTo(userAvatarImageView.snp.bottom).offset(4)
            make.centerX.equalTo(userAvatarImageView.snp.centerX)
        }
    }
    
    private func setupGoToIssueButton() {
        addSubview(goToIssueButton)
        goToIssueButton.setTitle("Visit Issue", for: .normal)
        goToIssueButton.snp_makeConstraints { make in
            make.centerY.equalTo(userAvatarImageView.snp.centerY)
            make.right.equalToSuperview().inset(32)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp_makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    private func setupCreatedLabel() {
        addSubview(createdLabel)
        createdLabel.font = UIFont.systemFont(ofSize: 12)

        createdLabel.snp_makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
        }
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textAlignment = .justified
        descriptionLabel.snp_makeConstraints { make in
             make.top.equalTo(createdLabel.snp.bottom).offset(16)
             make.left.equalToSuperview().offset(16)
             make.right.equalToSuperview().inset(16)
        }
    }
}
