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
            let screenWidth = UIScreen.main.bounds.size.width
            // см. BusyboardsGroupHeader.xib
            let headerLabelWidth = screenWidth - 16 - 16
            let descriptionLabelWidth = screenWidth - 16 - 8 - 44
            let headerHeight = headerName?.height(withConstrainedWidth: headerLabelWidth, font: UIFont.menlo15!)
            let descriptionHeight = groupDescription?.height(withConstrainedWidth: descriptionLabelWidth, font: UIFont.menlo13!)
            return descriptionHeight! + headerHeight! + 8 + 4 + 6
        }
    }
    
    var isShown: Bool = true
    
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
