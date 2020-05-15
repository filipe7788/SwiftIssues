import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class IssueListViewController: UIViewController {
    private var mainView = IssueListView()
    private var viewModel: IssueListViewModelProtocol!
    
    private let issuesDataSource = RxTableViewSectionedReloadDataSource<SectionViewModelType<IssueCellViewModel>>(
        configureCell: {_, _, _, _ in return UITableViewCell() }
    )
    
    let disposeBag = DisposeBag()
    
    // MARK: Init
    init(viewModel: IssueListViewModelProtocol) {
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.remakeTableConstraints()
    }
    
    override func loadView() {
        view = mainView
    }
    
    // MARK: Setup
    private func setupInputs() {
        mainView.tableView.rx
            .modelSelected(IssueCellViewModel.self)
            .bind(to: viewModel.inputs.issueSelected)
            .disposed(by: disposeBag)
    }
    
    func setupOutputs() {
        let identifier = String(describing: IssueCell.self)
        mainView.tableView.register(IssueCell.self, forCellReuseIdentifier: identifier)
        issuesDataSource.configureCell = { _, tableView, indexPath, itemViewModel in
            let cell = (tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? IssueCell)!
            cell.viewModel = itemViewModel
            return cell

        }
        
        viewModel.outputs.issues
             .drive(mainView.tableView.rx.items(dataSource: issuesDataSource))
         .disposed(by: disposeBag)
    }
}
