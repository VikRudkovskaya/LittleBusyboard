//
//  SwitchLightAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class SwitchLightAction: ComponentAction {
    var lightBubles: [LightbulbComponent] // лампочки, которые включаются по этому действи
    
    init(lightBubles: [LightbulbComponent]) {
        self.lightBubles = lightBubles
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
