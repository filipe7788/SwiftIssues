//
//  LoadingState.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation

struct LoadingState {
    var isLoading: Bool
    var error: Error?
    
    init(isLoading: Bool, error: Error? = nil) {
        self.isLoading = isLoading
        self.error = error
    }
}
