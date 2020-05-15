//
//  Coordinator.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import UIKit

public protocol CoordinatorPath { }

public protocol CoordinatorProtocol: class {
    func route(to path: CoordinatorPath)
    func finish()
}

public protocol Coordinator: CoordinatorProtocol {
    init(navigationController: UINavigationController)
    
    func start()
}
