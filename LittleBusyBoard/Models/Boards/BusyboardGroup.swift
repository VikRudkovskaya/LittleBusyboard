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
    
    private var _footerImageName: String?
    var footerImageName: String {
        get {
            guard let value = _footerImageName else {
                // Рандомный выбор значения по-умолчанию
                let availibleFooters = ["castle_v1", "castle_v2", "castle_v4", "castle_v5", "castle_v6", "castle_v7", "castle_v8", "castle_v9", "sword_v1", "sword_v2", "sword_v3", "sword_v4", "sword_v5", "swords_v2", "swords_v3", "swords_v4", "shield_v1", "shield_v2", "shield_swords"]
                return availibleFooters[Utils.random(availibleFooters.count)]
            }
            return value
        }
        set(value) {
            _footerImageName = value
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
