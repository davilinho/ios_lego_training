//
//  DataSource.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct DataSource {

    func retrieveLegoList() -> [LegoItem] {
        return (1..<10).map { LegoItem(id: $0, text: "Lego \($0)",
            url: "https://randomuser.me/api/portraits/lego/\($0).jpg",
            type: getLegoType(by: $0)) }
    }

    private func getLegoType(by id: Int) -> LegoType {
        return id % 2 == 0 ? LegoType.withHat : LegoType.withoutHat
    }

    func retrieveLego(by id: Int) -> LegoItem? {
        return retrieveLegoList().first { $0.id == id }
    }
}
