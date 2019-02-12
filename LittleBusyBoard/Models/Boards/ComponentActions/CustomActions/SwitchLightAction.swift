//
//  SwitchLightAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class SwitchLightAction: ComponentAction {
    var lightBubles: [LightbulbComponent] // лампочки, которые включаются по этому действию
    
    init(lightBubles: [LightbulbComponent]) {
        self.lightBubles = lightBubles
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case lightBubles
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lightBubles = try container.decode([LightbulbComponent].self, forKey: .lightBubles)
        try super.init(from: decoder)
    }
    
    override func perform() {
        super.perform()
        self.bulbsON()
    }
    
    func bulbsON() {
        for bulb in lightBubles {
            bulb.on = true
        }
    }
}
