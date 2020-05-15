//
//  SectionViewModelType.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import RxDataSources

protocol ViewModel {}

final class SectionViewModelType<T: ViewModel> {
    
    private let viewModels: [T]
    private let title: String?
    
    init(title: String? = nil, viewModels: [T]) {
        self.viewModels = viewModels
        self.title = title
    }
}

extension SectionViewModelType: SectionModelType {
    
    typealias Item = T
    
    var items: [Item] {
        return viewModels
    }
    
    var header: String? {
        return title
    }
    
    convenience init(original: SectionViewModelType, items: [Item]) {
        self.init(title: original.title, viewModels: items)
    }
    
}
