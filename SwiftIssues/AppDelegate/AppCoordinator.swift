//
//  AppCoordinator.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import UIKit

public protocol AppCoordinatorProcotol: CoordinatorProtocol {
    func back()
}

enum AppPath: CoordinatorPath {
    case detail(issue: Issue)
}

public class AppCoordinator: Coordinator, AppCoordinatorProcotol {
    
    let rootNavigationController: UINavigationController
    
    required public init(navigationController: UINavigationController) {
        rootNavigationController = navigationController
    }
   
    public func start() {
        let viewController = IssueListViewController(viewModel: IssueListViewModel(coordinator: self))
        rootNavigationController.isNavigationBarHidden = true
        rootNavigationController.pushViewController(viewController, animated: false)
    }
    
    public func route(to path: CoordinatorPath) {
       guard let path = path as? AppPath else { return }
       switch path {
       case .detail(let issue):
        let viewController = IssueDetailViewController(viewModel: IssueDetailViewModel(issue: issue, coordinator: self))
            rootNavigationController.present(viewController, animated: true)
        }
    }

    public func finish() {
        
    }
    
    public func back() {
        rootNavigationController.topViewController?.dismiss(animated: true)
    }
    
}
