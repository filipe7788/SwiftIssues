//
//  IssueDetailSpec.swift
//  DesafioImprovingTests
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Quick
import Nimble
import RxCocoa
import RxSwift
import RxTest
import UIKit


@testable import DesafioImproving

class IssueDetailSpec: QuickSpec {
    override func spec() {

        describe("IssueDetails") {
            
            var coordinator: AppCoordinatorSpy!
            var viewModel: IssueDetailViewModelProtocol!
            var scheduler: TestScheduler!
            var disposeBag: DisposeBag!
            
            beforeEach {
                coordinator = AppCoordinatorSpy(navigationController: UINavigationController())
                viewModel = IssueDetailViewModel(issue: Issue(), coordinator: coordinator)
                scheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()
            }
            
            context("when user tap back button") {
               beforeEach {
                scheduler.createColdObservable([Recorded.next(0, ())]).bind(to: viewModel.inputs.back).disposed(by: disposeBag)
                
                    scheduler.start()
               }
            
                it("should dismiss screen") {
                    expect(coordinator.isBack).to(beTrue())
                }
            }
            
            context("when screen loads") {
                var issueDetailObserver: TestableObserver<Issue>!

                beforeEach {
                    issueDetailObserver = scheduler.createObserver(Issue.self)
                    scheduler.createColdObservable([Recorded.next(0, ())]).bind(to: viewModel.inputs.didLoad).disposed(by: disposeBag)
                    viewModel.outputs.details
                         .drive(issueDetailObserver)
                         .disposed(by: disposeBag)
                    
                    scheduler.start()
                }
                
                it("should present a blank issue") {
                    expect(issueDetailObserver.events.first?.value.element?.title).to(equal(""))
                }
            }
        }
    }
}
