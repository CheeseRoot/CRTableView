//
//  CRTableViewSectionModel.swift
//  CRTableView
//
//  Created by Sudhanshu Singh on 1/31/17.
//  Copyright © 2017 Sudhanshu Singh. All rights reserved.
//

import Foundation

class CRTableViewSectionModel: NSObject {
    
    var cellModels = [CRTableViewCellModel]()
    var index: Int?
    
    func removeAllCells() {
        cellModels.removeAll()
    }
    
    func removeCellAtIndex(_ index: Int) {
        cellModels.remove(at: index)
    }
    
    func removeAllCellsOtherThanIndex(_ index: Int) {
        for i in 0...(cellModels.count - 1) {
            if i != index {
                cellModels.remove(at: i)
            }
        }
    }
    
    func addCellModel(_ cellModel: CRTableViewCellModel, atIndex index: Int) {
        if index >= 0 && index <= cellModels.count {
            cellModels.insert(cellModel, at: index)
        }
    }
    
    func addCellModel(_ cellModel: CRTableViewCellModel) {
        cellModels.append(cellModel)
    }
    
    func addCellModels(_ cellModelArray: [CRTableViewCellModel]) {
        for cellModel in cellModelArray {
            addCellModel(cellModel)
        }
    }
}
