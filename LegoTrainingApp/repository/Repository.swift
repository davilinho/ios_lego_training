//
//  Repository.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct Repository {

    private var dataSource: DataSource!

    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }

    func retrieveList(callback: ([LegoItem]) -> Void) {
        callback(dataSource.retrieveLegoList())
    }

    func retrieveDetail(by id: Int, callback: (LegoItem?) -> Void) {
        callback(dataSource.retrieveLego(by: id))
    }
}
