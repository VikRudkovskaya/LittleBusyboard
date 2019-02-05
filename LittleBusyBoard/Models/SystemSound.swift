//
//  SystemSound.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 04/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

struct SystemSound: Decodable {

    let soundID: Int
    let fileName: String?
    let category: String?
    
    enum CodingKeys : String, CodingKey {
        case soundID = "systemSoundID"
        case fileName
        case category
    }
    
    
}

