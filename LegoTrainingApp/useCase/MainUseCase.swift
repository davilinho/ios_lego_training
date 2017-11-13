//
//  MainUseCase.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

class MainUseCase: UseCase {

    private var repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    internal func executeUseCaseImplementation(with request: Void?, callback: @escaping ([LegoItem]) -> Void) {
        repository.retrieveList(callback: callback)
    }
}
