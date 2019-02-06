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
    
    var header: String?
    
    var headerBgName: String?
    
    var boards: [Busyboard]?
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    enum CodingKeys : String, CodingKey {
        case identifier
        case header
        case headerBgName
        case boards
    }
    
}
