//
//  Background.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

struct Background: Decodable {
    
    var identifier: Int?
    
    var name: String?
    
    var bgDescription: String?
    
    var fileName: String?
    
    var url: String?
    
    enum CodingKeys : String, CodingKey {
        case identifier
        case name
        case bgDescription = "description"
        case fileName
        case url
    }
}
