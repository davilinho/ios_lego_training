//
//  MainPresenter.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct MainPresenter {

    weak var view: MainViewController!

    private var useCase: MainUseCase!

    init (useCase: MainUseCase) {
        self.useCase = useCase
    }

    func loadImages() {
        useCase.execute(request: nil) { response in
            view.showImages(list: response) { self.view.refreshList() }
        }
    }

    func filterImages(by type: LegoType) {
        useCase.execute(request: nil) { response in
            view.showImages(list: response.filter() { $0.type == type } ) { self.view.refreshList() }
        }
    }
}
