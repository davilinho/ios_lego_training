//
//  DetailUseCase.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct DetailUseCase: UseCase {

    typealias T1 = Int
    typealias T2 = LegoItem

    private var repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(request: Int?, callback: (LegoItem) -> Void) {
        repository.retrieveDetail(by: request!) { response in callback(response!) }
    }
}
