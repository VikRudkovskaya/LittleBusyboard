//
//  BusyboardType.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 05/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardsGroup: Decodable {
    
    var identifier: String
    
    var headerName: String?
    
    var groupDescription: String?
    
    var headerBgName: String?
    
    var boards: [Busyboard]?
    
    var headerHeight: CGFloat {
        get {
            let labelWidth = UIScreen.main.bounds.size.width - 16 - 16 // см. BusyboardsGroupHeader.xib
            let headerHeight = headerName?.height(withConstrainedWidth: labelWidth, font: UIFont.menlo15!)
            let descriptionHeight = groupDescription?.height(withConstrainedWidth: labelWidth, font: UIFont.menlo13!)
            return descriptionHeight! + headerHeight! + 8 + 4 + 6
        }
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    enum CodingKeys : String, CodingKey {
        case identifier
        case headerName
        case groupDescription = "description"
        case headerBgName
        case boards
    }
    
}
