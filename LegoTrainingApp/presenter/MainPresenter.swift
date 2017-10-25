//
//  MainPresenter.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

class MainPresenter {

    weak var view: MainViewController!

    init (view: MainViewController) {
        self.view = view
    }

    func loadImages() {
        Repository().retrieveList { response in
            view.showImages(list: response) { self.view.refreshList() }
        }
    }

    func filterImages(by type: LegoType) {
        Repository().retrieveList { response in
            view.showImages(list: response.filter() { $0.type == type } ) { self.view.refreshList() }
        }
    }
}
