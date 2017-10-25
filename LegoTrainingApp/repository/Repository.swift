//
//  Repository.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

class Repository {

    func retrieveList(callback: ([LegoItem]) -> Void) {
        callback(retrieveLegoList())
    }

    private func retrieveLegoList() -> [LegoItem] {
        return (1..<10).map { LegoItem(id: $0, text: "Lego \($0)",
                                       url: "https://randomuser.me/api/portraits/lego/\($0).jpg",
                                       type: getLegoType(id: $0)) }
    }

    private func getLegoType(id: Int) -> LegoType {
        return id % 2 == 0 ? LegoType.withHat : LegoType.withoutHat
    }
}
