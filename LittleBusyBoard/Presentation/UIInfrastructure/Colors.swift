//
//  Colors.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let coolPurpleRed = UIColor(red:188 / 255, green:39 / 255, blue:70 / 255, alpha: 1)
    
    convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let red     = CGFloat((hex3 & 0xF00) >> 8) / 0xF
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / 0xF
        let blue    = CGFloat((hex3 & 0x00F) >> 0) / 0xF
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hex4: UInt16) {
        let red     = CGFloat((hex4 & 0xF000) >> 12) / 0xF
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / 0xF
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / 0xF
        let alpha   = CGFloat((hex4 & 0x000F) >>  0) / 0xF
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / 0xFF
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / 0xFF
        let blue    = CGFloat((hex6 & 0x0000FF) >>  0) / 0xFF
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
