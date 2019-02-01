//
//  PlaySoundAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 31/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class PlaySoundAction: ComponentAction {
    
    let systemSoundID: Int
    
    init(soundID: Int) {
        self.systemSoundID = soundID
    }
}
