//
//  API.swift
//  DesafioImproving
//
//  Created by Filipe da Cruz RIbeiro on 14/05/20.
//  Copyright © 2020 Filipe da Cruz RIbeiro. All rights reserved.
//

import RxSwift
import RxCocoa
import Moya

class API {
    let provider = MoyaProvider<IssuesService>()
    
    func getIssues() -> Observable<Result<[Issue]>> {
        return Observable.create { observer in
            self.provider.request(.getIssues) { event in
                switch event {
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        let issues = try decoder.decode([Issue].self, from: value.data)
                        observer.onNext(.success(issues))
                        observer.onCompleted()
                    } catch {
                        observer.onError(IssuesError.parseError)
                        observer.onCompleted()
                    }
                case .failure:
                    observer.onError(IssuesError.noConnection)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
