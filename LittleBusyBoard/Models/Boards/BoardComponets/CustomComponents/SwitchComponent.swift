//
//  SwitchComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class SwitchComponent: BoardComponent {
    
    override func view() -> UIView {
        return UIButton()
    }
    
        
    var onTextureName: String = "button_red"
    
    var offTextureName: String = "button_red"
    
    private enum CodingKeys: String, CodingKey {
        case onTextureName
        case offTextureName
        case on
    }
    
    var currentTextureName: String {
        if on {
            return onTextureName
        }
        return offTextureName
    }
    
    var on: Bool = false

}
