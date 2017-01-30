//
//  CRTableViewCell.swift
//  CRTableView
//
//  Created by Sudhanshu Singh on 1/31/17.
//  Copyright © 2017 Sudhanshu Singh. All rights reserved.
//

import UIKit

protocol CRTableViewCellProtocol: class {
    func configureCell(_ model: CRTableViewCellModel)
}

class CRTableViewCell: UITableViewCell, CRTableViewCellProtocol {
    
    func configureCell(_ model: CRTableViewCellModel) {
    }
}
