//
//  AppCoordinatorSpy.swift
//  DesafioImprovingTests
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

@testable import DesafioImproving

class AppCoordinatorSpy: AppCoordinator {
    var isBack = false
    
    
    override func back() {
        isBack = true
    }
}
