//
//  ViewController.swift
//  LegoTrainingApp
//
//  Created by David Martin on 13/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {

    func showOfflineMessage() {
        view.makeToast("No hay conexión a internet, por favor vuelve a intentarlo en unos instantes...")
    }
}
