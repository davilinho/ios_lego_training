//
//  DetailPresenter.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct DetailPresenter {

    weak var view: DetailViewController!

    private var useCase: DetailUseCase!

    init(useCase: DetailUseCase) {
        self.useCase = useCase
    }

    func loadDetail(by id: Int) {
        useCase.execute(request: id) { response in
            view.showDetail(from: response)
        }
    }

    func openInfoDetail(from item: LegoItem) {
        view.showInfoDetail(from: "\(item.id)\n\(item.text)\n\(item.url)")
    }
}
