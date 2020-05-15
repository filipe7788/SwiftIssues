//
//  IssueCellViewModel.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation

class IssueCellViewModel: ViewModel {
    var issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }
}
