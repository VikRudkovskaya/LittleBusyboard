//
//  Busyboard.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class Busyboard: NSObject {
    
    var name: String = "Бизиборд"
    
    var boardDescription = "Этот потрясающий бизиборд"
    
    var miniatureName: String?
    
    var background: Background?
    
    // Набор компонентов борды
    var boardComponents: [BoardComponent]?
    
}
