//
//  MainViewController.swift
//  LegoTrainingApp
//
//  Created by David Martin on 24/10/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import UIKit
import SDWebImage

class MainViewController: ViewController {

    lazy var presenter: MainPresenter = injector().mainPresenter

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    var currentFilter: LegoType = .all
    var results: [LegoItem] = []

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadImagesByFilter), for: .valueChanged)
        refreshControl.backgroundColor = UIColor.blue
        refreshControl.tintColor = UIColor.white
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        configureSegmentedControl()
        injectView()
        loadImagesByFilter()
    }

    override func showOfflineMessage() {
        super.showOfflineMessage()
        self.refreshControl.endRefreshing()
    }

    private func configureNavigationBar() {
        if let navigationBar = navigationController?.navigationBar {
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
                statusBar.backgroundColor = UIColor.blue
            }

            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.backgroundColor = UIColor.blue
            navigationBar.shadowImage = UIImage()
            navigationItem.rightBarButtonItem?.tintColor = UIColor.white
            navigationItem.hidesBackButton = true
        }
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.addSubview(self.refreshControl)
        tableView.rowHeight = 100
    }

    private func configureSegmentedControl() {
        segmented.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
    }

    private func injectView() {
        presenter.view = self
    }

    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                currentFilter = LegoType.all
                break
            case 1:
                currentFilter = LegoType.withHat
                break
            case 2:
                currentFilter = LegoType.withoutHat
                break
            default: break
        }
        loadImagesByFilter()
    }

    @objc private func loadImagesByFilter() {
        switch currentFilter {
            case .all:
                loadImages()
                break
            case .withHat:
                filterImagesWithHat()
                break
            case .withoutHat:
                filterImagesWithoutHat()
                break
        }
    }

    @objc private func loadImages() {
        presenter.loadImages()
    }

    private func filterImagesWithHat() {
        presenter.filterImages(by: .withHat)
    }

    private func filterImagesWithoutHat() {
        presenter.filterImages(by: .withoutHat)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailViewController
                destinationVC.id = results[indexPath.item].id
            }
        }
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LegoItemCell = tableView.dequeueReusableCell(withIdentifier: "LegoItemCell", for: indexPath)
            as! LegoItemCell

        let item = results[indexPath.row]
        cell.legoTitle.text = item.text
        cell.legoImage.sd_setShowActivityIndicatorView(true)
        cell.legoImage.sd_setIndicatorStyle(.gray)
        cell.legoImage.sd_setImage(with: URL(string: item.url), completed: nil)
        cell.legoImage.layer.borderColor = UIColor.black.cgColor
        cell.legoImage.layer.borderWidth = 2
        cell.legoType.text = Utils.mapLegoDescription(by: item.type)
        return cell
    }
}

extension MainViewController: IMainView {

    func showImages(list: [LegoItem], callback: @escaping () -> Void) {
        results.removeAll()
        results = list
        DispatchQueue.main.async {
            callback()
        }
    }

    func refreshList() {
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
}
