//
//  Result.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation

public struct ErrorWrapper {
    var error: Error = IssuesError.noConnection
    var message: String = "Error"
    
    init() {}
    
    init(error: Error, message: String) {
        self.error = error
        self.message = message
    }
    
    init(message: String) {
        self.message = message
    }
}

enum Result<T> {
    case success(T)
    case failure(ErrorWrapper)
}

extension Result {
    var value: T? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    
    var failure: ErrorWrapper? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

enum IssuesError: Error {
    case noConnection
    case parseError
}
