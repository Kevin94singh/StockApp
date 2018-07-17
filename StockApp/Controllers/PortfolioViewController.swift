//
//  PortfolioViewController.swift
//  StockApp
//
//  Created by Kevin Singh on 7/16/18.
//  Copyright © 2018 MakeSchoolHackathon. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    
    let addNavigationItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.barStyle = .black
            navigationItem.rightBarButtonItem = addNavigationItem
            navigationItem.rightBarButtonItem?.image = UIImage(named: "addIcon")
            navigationItem.rightBarButtonItem?.tintColor = .white
        }
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    @objc func addTapped() {
        print("add button tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PortfolioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Owned Stocks"
    }
}

extension PortfolioViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioStockTableViewCell") as! PortfolioStockTableViewCell
        if indexPath.row == 0 {
            cell.stockTitle.text = "AMZN"
            cell.stockPrice.text = "price"
            cell.stockAmount.text = "amount"
            cell.stockValue.text = "value"
        } else {
            cell.stockTitle.text = "AAPL"
            cell.stockPrice.text = "price"
            cell.stockAmount.text = "amount"
            cell.stockValue.text = "value"
        }
        return cell
    }
}
