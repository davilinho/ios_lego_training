//
//  UseCase.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

protocol UseCase {
    associatedtype T1
    associatedtype T2
    func execute(request: T1?, callback: (T2) -> Void)
}
