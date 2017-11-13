//
//  DetailUseCase.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct DetailUseCase: UseCase {

    private var repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    internal func executeUseCaseImplementation(with request: Int?, callback: @escaping (LegoItem) -> Void) {
        repository.retrieveDetail(by: request!) { response in callback(response!) }
    }
}
