//
//  CRTableViewModel.swift
//  CRTableView
//
//  Created by Sudhanshu Singh on 1/31/17.
//  Copyright © 2017 Sudhanshu Singh. All rights reserved.
//

import Foundation

class CRTableViewModel: NSObject {
    
    var sectionModels = [CRTableViewSectionModel]()
    
    fileprivate func newSectionModel() -> CRTableViewSectionModel {
        let sectionModel = CRTableViewSectionModel()
        addSectionModel(sectionModel)
        return sectionModel
    }
    
    fileprivate func lastSectionModel() -> CRTableViewSectionModel? {
        if sectionModels.count > 0 {
            if let sectionModel = sectionModels.last {
                return sectionModel
            }
        }
        return nil
    }
    
    func addSectionModel(_ sectionModel: CRTableViewSectionModel) {
        sectionModels.append(sectionModel)
    }
    
    func addCellModel(_ cellModel: CRTableViewCellModel) {
        guard let sectionModel = lastSectionModel() else {
            let lastSectionModel = newSectionModel()
            addCellModel(cellModel, toSectionModel: lastSectionModel)
            return
        }
        addCellModel(cellModel, toSectionModel: sectionModel)
    }
    
    func addCellModel(_ cellModel: CRTableViewCellModel, atIndex index: Int) {
        lastSectionModel()?.addCellModel(cellModel, atIndex: index)
    }
    
    func addCellModel(_ cellModel: CRTableViewCellModel, toSectionModel sectionModel: CRTableViewSectionModel) {
        if !sectionModels.contains(sectionModel) {
            addSectionModel(sectionModel)
        }
        sectionModel.addCellModel(cellModel)
    }
    
    func addCellModels(_ cellModels: [CRTableViewCellModel], toSectionModel sectionModel: CRTableViewSectionModel) {
        for cellModel in cellModels {
            addCellModel(cellModel, toSectionModel: sectionModel)
        }
    }
    
    func removeSectionAtIndex(_ index: Int) {
        if sectionModels.count > index {
            sectionModels.remove(at: index)
        }
    }
    
    func removeAllSections() {
        sectionModels.removeAll()
    }
}
