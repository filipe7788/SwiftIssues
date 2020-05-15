import Foundation
import RxSwift
import RxCocoa

protocol IssueDetailViewModelInput {
    var didLoad: PublishSubject<Void> { get }
    var back: PublishSubject<Void> { get }
}

protocol IssueDetailViewModelOutput {
    var details: Driver<Issue> { get }
}

protocol IssueDetailViewModelProtocol: ViewModel {
    var inputs: IssueDetailViewModelInput { get }
    var outputs: IssueDetailViewModelOutput { get }
}

class IssueDetailViewModel: IssueDetailViewModelInput, IssueDetailViewModelProtocol {
    var didLoad = PublishSubject<Void>()
    var back = PublishSubject<Void>()
    
    var issueSubject = PublishSubject<Issue>()

    var inputs: IssueDetailViewModelInput { return self }
    var outputs: IssueDetailViewModelOutput { return self }
    
    private var disposeBag = DisposeBag()

    init(issue: Issue, coordinator: AppCoordinatorProcotol) {
        back.subscribe(onNext: { _ in
            coordinator.back()
        }).disposed(by: disposeBag)
        
        didLoad.subscribe(onNext: { [weak self] _ in
            self?.issueSubject.onNext(issue)
        }).disposed(by: disposeBag)
    }
}

// MARK: IssueDetail ViewModelOutput
extension IssueDetailViewModel: IssueDetailViewModelOutput {
    var details: Driver<Issue> {
        return issueSubject.asDriver(onErrorJustReturn: Issue())
    }
    
}
