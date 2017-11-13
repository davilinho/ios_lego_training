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
        useCase.execute(with: id, offlineCallback: {
            self.view.showOfflineMessage()
        }, onlineCallback: { response in
            self.view.showDetail(from: response)
        })
    }

    func openInfoDetail(from item: LegoItem?) {
        guard item != nil else {
            self.view.showOfflineMessage()
            return
        }
        view.showInfoDetail(from: "\(String(describing: item?.id))\n\(String(describing: item?.text))" +
            "\n\(String(describing: item?.url))")
    }
}
