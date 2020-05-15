//
//  ApiErrorHandler.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation

final class ApiErrorHandler {
    
    static let sharedInstance = ApiErrorHandler()
    
    var appCoordinator: AppCoordinator!
    
    private init() {}
    
}
