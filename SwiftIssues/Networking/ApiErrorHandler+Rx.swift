//
//  ApiErrorHandler+Rx.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol ApiErrorHandlerObserver {
    var handleApiError: PublishSubject<ErrorWrapper> { get }
}

extension ApiErrorHandler: ReactiveCompatible {}

extension Reactive where Base: ApiErrorHandler {
    
    var handleError: Binder<(errorWrapper: ErrorWrapper, errorHandlerObserver: ApiErrorHandlerObserver?)> {
        return Binder(self.base) { control, options in
            if let errorHandlerObserver = options.errorHandlerObserver {
                errorHandlerObserver.handleApiError.onNext(options.errorWrapper)
             } else {
                if let currentViewController = control.appCoordinator?.rootNavigationController.visibleViewController {
                     let alert = AlertRenderer(viewController: currentViewController)

                     alert.showAlert(options: AlertOptions(title: nil, message: options.errorWrapper.message), completion: nil)
                 }
             }
        }
    }
    
}
