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

    func executeUseCaseImplementation(with request: T1?, callback: @escaping (T2) -> Void)
}

extension UseCase {

    func execute(with request: T1?, offlineCallback: @escaping () -> Void, onlineCallback: @escaping (T2) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if Connectivity.isConnectedToInternet() {
                self.executeUseCaseImplementation(with: request) { response in
                    DispatchQueue.main.async { onlineCallback(response) }
                }
            } else {
                DispatchQueue.main.sync { offlineCallback() }
            }
        }
    }
}
