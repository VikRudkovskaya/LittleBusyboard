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
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case systemSound
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.systemSound = try container.decode(SystemSound.self, forKey: .systemSound)
        try super.init(from: decoder)
    }
    
    override func perform() {
        super.perform()
        
        self.playSound(soundID: self.systemSound.soundID)
    }
    
    func playSound(soundID: Int) {
        AudioServicesPlaySystemSound(SystemSoundID(soundID))
    }
}
