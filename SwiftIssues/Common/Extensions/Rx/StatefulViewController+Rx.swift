//
//  StatefulViewController+Rx.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import StatefulViewController

extension Reactive where Base: StatefulViewController {
    
    var isLoading: Binder<LoadingState> {
        return Binder(self.base) { control, value in
            value.isLoading ? control.startLoading() : control.endLoading(error: value.error)
        }
    }
}
