//
//  DetailPresenter.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

class DetailPresenter {

    weak var view: DetailViewController!

    init(view: DetailViewController) {
        self.view = view
    }

    func loadDetail(by id: Int) {
        Repository().retrieveList { response in
            view.showDetail(from: response.first() { $0.id == id }!)
        }
    }

    func openInfoDetail(from item: LegoItem) {
        view.showInfoDetail(from: "\(item.id)\n\(item.text)\n\(item.url)")
    }
}
