import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class IssueDetailViewController: UIViewController {
    private var mainView = IssueDetailView()
    private var viewModel: IssueDetailViewModelProtocol!
    
    let disposeBag = DisposeBag()
    
    // MARK: Init
    init(viewModel: IssueDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutputs()
        setupInputs()
        viewModel.inputs.didLoad.onNext(())
    }
    
    override func loadView() {
        view = mainView
    }
    
    // MARK: Setup
    private func setupInputs() {
        mainView.backButton.rx.tap.bind(to: viewModel.inputs.back).disposed(by: disposeBag)
    }
    
    func setupOutputs() {
        viewModel.outputs.details.drive(onNext: { [weak self] issue in
            self?.mainView.titleLabel.text = issue.title
            self?.mainView.descriptionLabel.text = issue.description
            self?.mainView.userNameLabel.text = issue.author.name
            
            if let avatarURL = URL(string: issue.author.avatarURL) {
                self?.mainView.userAvatarImageView.af.setImage(withURL: avatarURL)
            }
            
            let isoFormatter = ISO8601DateFormatter()
            let date = isoFormatter.date(from: issue.createdDate)!
            let inputDateFormatter = DateFormatter()
            inputDateFormatter.dateFormat = "dd/MM/yyyy"
            self?.mainView.createdLabel.text = inputDateFormatter.string(from: date)
            
        
            self?.mainView.goToIssueButton.rx.tap.subscribe(onNext: { _ in
                if let url = URL(string: issue.urlAcess) {
                    UIApplication.shared.open(url)
                }
            })
            
        }).disposed(by: disposeBag)
    }
}
