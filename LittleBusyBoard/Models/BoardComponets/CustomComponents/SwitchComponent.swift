//
//  SwitchComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class SwitchComponent: BoardComponent {
    
    var onTextureName: String = "button_red"
    
    var offTextureName: String = "button_red"
    
    var currentTextureName: String {
        if on {
            return onTextureName
        }
        return offTextureName
    }
    
    var on: Bool = false
}
