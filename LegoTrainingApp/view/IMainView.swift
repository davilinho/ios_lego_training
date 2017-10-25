//
//  IMainView.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Foundation

protocol IMainView {
    func showImages(list: [LegoItem], callback: @escaping () -> Void)
    func refreshList()
}
