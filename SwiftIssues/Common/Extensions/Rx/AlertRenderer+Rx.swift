//
//  AlertRenderer+Rx.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension AlertRenderer: ReactiveCompatible {}

extension Reactive where Base: AlertRenderer {
    
    var alertOptions: Binder<AlertOptions> {
        return Binder(self.base) { control, options in
            control.showAlert(options: options, completion: nil)
        }
    }
}
