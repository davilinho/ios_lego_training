//
//  DetailViewController.swift
//  LegoTrainingApp
//
//  Created by David Martin on 25/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import UIKit
import Toast_Swift

class DetailViewController: ViewController {

    lazy var presenter: DetailPresenter = injector().detailPresenter

    @IBOutlet weak var legoImage: UIImageView!
    @IBOutlet weak var legoText: UILabel!

    var id: Int!
    var item: LegoItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        injectView()
        loadDetail()
    }

    @IBAction func didTapButton(_ sender: Any) {
        presenter.openInfoDetail(from: item)
    }

    private func injectView() {
        presenter.view = self
    }

    private func loadDetail() {
        presenter.loadDetail(by: id)
    }
}

extension DetailViewController: IDetailView {

    func showDetail(from item: LegoItem) {
        self.item = item
        self.title = item.text
        legoImage.sd_setImage(with: URL(string: item.url), completed: nil)
        legoText.text = Utils.mapLegoDescription(by: item.type)
    }

    func showInfoDetail(from message: String) {
        view.makeToast(message)
    }
}
