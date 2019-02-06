//
//  BusyboardType.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 05/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardsGroup: NSObject {
    
    var identifier: String
    
    var header: String?
    
    var headerBgName: String?
//    {
//        get {
//            switch identifier {
//            case "OneButton":
//                return "Однокнопочный"
//                case "Button"
//            default:
//                return ""
//            }
//        }
//    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
}
