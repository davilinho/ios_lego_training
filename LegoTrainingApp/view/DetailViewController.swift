//
//  DetailViewController.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import UIKit
import Toast_Swift

class DetailViewController: UIViewController {

    lazy var presenter: DetailPresenter = DetailPresenter(view: self)

    @IBOutlet weak var legoImage: UIImageView!
    @IBOutlet weak var legoText: UILabel!

    var id: Int!
    var item: LegoItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetail()
    }

    @IBAction func didTapButton(_ sender: Any) {
        presenter.openInfoDetail(from: item)
    }

    private func loadDetail() {
        presenter.loadDetail(by: id)
    }
}

extension DetailViewController: IDetailView {

    func showDetail(from item: LegoItem) {
        self.item = item
        legoImage.sd_setImage(with: URL(string: item.url), completed: nil)
        legoText.text = Utils.mapLegoDescription(by: item.type)
    }

    func showInfoDetail(from message: String) {
        view.makeToast(message)
    }
}
