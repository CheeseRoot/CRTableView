//
//  CRTableViewController.swift
//  CRTableView
//
//  Created by Sudhanshu Singh on 1/31/17.
//  Copyright © 2017 Sudhanshu Singh. All rights reserved.
//

import UIKit

class CRTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewModel: CRTableViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.isHidden = false
                self.tableView?.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        registerNibs()
        tableViewModel = createTableViewModel()
    }
    
    //MARK:
    //MARK: override methods
    func registerNibs() {
        // Override in all child classes
    }
    
    func createTableViewModel() -> CRTableViewModel {
        return CRTableViewModel()
    }
    
    func reloadTableView() {
        tableViewModel = createTableViewModel()
    }
    
    
    //MARK:
    //MARK: UITableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewModel?.sectionModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel = tableViewModel?.sectionModels[section]
        return sectionModel?.cellModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = tableViewModel?.sectionModels[indexPath.section]
        guard let cellModel = sectionModel?.cellModels[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.reuseIdentifier, for: indexPath) as! CRTableViewCell
        cell.configureCell(cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionModel = tableViewModel?.sectionModels[indexPath.section]
        if let cellModel = sectionModel?.cellModels[indexPath.row], let height = cellModel.height {
            return height
        }
        return UITableViewAutomaticDimension
    }
}
