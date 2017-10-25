//
//  IDetailView.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

protocol IDetailView {
    func showDetail(from item: LegoItem)
    func showInfoDetail(from message: String)
}
