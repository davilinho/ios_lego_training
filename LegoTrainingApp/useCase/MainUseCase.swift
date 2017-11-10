//
//  MainUseCase.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

class MainUseCase: UseCase {

    typealias T1 = Void
    typealias T2 = [LegoItem]

    private var repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(request: Void?, callback: ([LegoItem]) -> Void) {
        repository.retrieveList(callback: callback)
    }
}
