//
//  PlaySoundAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 31/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundAction: ComponentAction {
    
    let systemSound: SystemSound
    
    init(systemSound: SystemSound) {
        self.systemSound = systemSound
    }
    
    override func perform() {
        super.perform()
        
        self.playSound(soundID: self.systemSound.soundID)
    }
    
    func playSound(soundID: Int) {
        AudioServicesPlaySystemSound(SystemSoundID(soundID))
    }
}
