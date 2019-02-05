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
    }
    
    override func perform() {
        super.perform()
        
        
    }

}
