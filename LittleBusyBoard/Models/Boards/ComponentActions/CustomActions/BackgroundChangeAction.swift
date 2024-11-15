//
//  BackgroundChangeAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 31/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BackgroundChangeAction: ComponentAction {
    
    // Бэкграунд, на который нужно поменять
    let newBackground: Background
    
    init(newBackground: Background) {
        self.newBackground = newBackground
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case newBackground
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newBackground = try container.decode(Background.self, forKey: .newBackground)
        try super.init(from: decoder)
    }
    
    override func perform() {
        super.perform()
        
        
    }

}
