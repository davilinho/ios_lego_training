//
//  Utils.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation
import Alamofire

struct Utils {

    static func mapLegoDescription(by legoType: LegoType) -> String {
        return LegoType.withHat == legoType ? "Con gorro" : "Sin gorro"
    }
}

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
