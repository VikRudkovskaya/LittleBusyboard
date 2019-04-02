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
    
    var soundPlayer: SoundPlayer = SoundPlayer()

    let soundFileName: String?
    
    init(soundFileName: String) {
        self.soundFileName = soundFileName
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.soundFileName = try container.decode(String.self, forKey: .soundFileName)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case soundFileName
    }
    
    override func perform() {
        super.perform()
        
        self.playSound(soundFileName: self.soundFileName ?? "")
    }
    
    func playSound(soundFileName: String) {
        DispatchQueue.main.async {
            self.soundPlayer.playSound(soundName: soundFileName)
        }
        
    }
}
