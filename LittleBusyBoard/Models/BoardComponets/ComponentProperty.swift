//
//  ComponentProperty.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

protocol Flyable: class {
    
}

class ComponentProperty: NSObject {
    // Реагирует ли объект на гироскоп
    var isFlyable: Bool = false
    // Меняет
    var isLightSwitch: Bool = false
    
    
    
}
