//
//  CRTableViewCellModel.swift
//  CRTableView
//
//  Created by Sudhanshu Singh on 1/31/17.
//  Copyright © 2017 Sudhanshu Singh. All rights reserved.
//

import UIKit

class CRTableViewCellModel {
    
    var reuseIdentifier: String
    var height: CGFloat?
    
    init(reuseIdentifier: String, height: CGFloat? = nil) {
        self.reuseIdentifier = reuseIdentifier
        self.height = height
    }
}
