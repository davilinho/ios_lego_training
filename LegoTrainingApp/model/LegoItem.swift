//
//  LegoItem.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

struct LegoItem {
    let id: Int
    var text: String
    let url: String
    let type: LegoType
}

enum LegoType {
    case all
    case withHat
    case withoutHat
}
