//
//  ServiceLocator.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct ServiceLocator {

    static let sharedInstance = ServiceLocator()

    private init() { }

    var dataSource: DataSource { return DataSource() }
    var repository: Repository { return Repository(dataSource: dataSource) }

    var mainUseCase: MainUseCase { return MainUseCase(repository: repository) }
    var mainPresenter: MainPresenter { return MainPresenter(useCase: mainUseCase) }

    var detailUseCase: DetailUseCase { return DetailUseCase(repository: repository) }
    var detailPresenter: DetailPresenter { return DetailPresenter(useCase: detailUseCase) }
}

extension NSObject {
    func injector() -> ServiceLocator { return ServiceLocator.sharedInstance }
}
