//
//  ButtonComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class ButtonComponent: NSObject, BoardComponent {
    func view() -> UIView {
        return UIButton()
    }
    
    var coordinates: CGPoint = CGPoint(x: 0, y: 0)
    
    var affectZone: CGRect?
    
    var actions: [ComponentAction]?
    
    
    var textureName: String = "button_red"
    
}
