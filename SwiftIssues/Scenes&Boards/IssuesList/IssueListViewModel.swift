import Foundation
import RxSwift
import RxCocoa

protocol IssueListViewModelInput {
    var didLoad: PublishSubject<Void> { get }
    var reload: PublishSubject<Void> { get }
    var issueSelected: PublishSubject<IssueCellViewModel> { get }
}

protocol IssueListViewModelOutput {
    var issues: Driver<[SectionViewModelType<IssueCellViewModel>]> { get }
}

protocol IssueListViewModelProtocol {
    var inputs: IssueListViewModelInput { get }
    var outputs: IssueListViewModelOutput { get }
}

struct IssueListViewModel: IssueListViewModelInput, IssueListViewModelProtocol {
        
    var inputs: IssueListViewModelInput { return self }
    var outputs: IssueListViewModelOutput { return self }
    
    // MARK: IssueList ViewModelInput
    let didLoad = PublishSubject<Void>()
    let reload = PublishSubject<Void>()
    let issueSelected = PublishSubject<IssueCellViewModel>()
    
    // MARK: Variables
    private var issuesItensSubject = PublishSubject<[SectionViewModelType<IssueCellViewModel>]>()
    private var issuesObservableResult: Observable<Result<[Issue]>>
    
    private let coordinator: AppCoordinatorProcotol
    private var activityIndicator: ActivityIndicator
    private var disposeBag = DisposeBag()
    
    // MARK: Init
    init(coordinator: AppCoordinatorProcotol) {
        self.coordinator = coordinator
        let indicator = ActivityIndicator()
        self.activityIndicator = indicator
        
        issuesObservableResult = Observable.merge(didLoad, reload).flatMap({ _ in
            return API().getIssues().trackActivity(indicator)
        }).share()
        
        issuesObservableResult
            .map { $0.value }
            .unwrap()
            .map { itens in
                return [SectionViewModelType<IssueCellViewModel>(viewModels: itens.map { return IssueCellViewModel(issue: $0) })]
                }
            .bind(to: issuesItensSubject)
            .disposed(by: disposeBag)
        
        issuesObservableResult.map { $0.failure }
            .unwrap()
            .map { ($0, nil) }
            .bind(to: ApiErrorHandler.sharedInstance.rx.handleError)
            .disposed(by: disposeBag)
        
        issueSelected.subscribe(onNext: { issueViewModel in
            coordinator.route(to: AppPath.detail(issue: issueViewModel.issue))
        }).disposed(by: disposeBag)
    }
    
}

// MARK: IssueList ViewModelOutput
extension IssueListViewModel: IssueListViewModelOutput {
    var issues: Driver<[SectionViewModelType<IssueCellViewModel>]> { return issuesItensSubject.asDriver(onErrorJustReturn: []) }
}
