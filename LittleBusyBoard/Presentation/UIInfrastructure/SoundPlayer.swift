//
//  Sound.swift
//  ARVTBPrototype
//
//  Created by Viktoria Rudkovskaya on 28/11/2018.
//  Copyright © 2018 Viktoria Rudkovskaya. All rights reserved.
//

import AVFoundation

class SoundPlayer: NSObject {
    
    var player = AVAudioPlayer()
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("playSound. Файл с указанным именем \(soundName) не найден")
            return
        }
        
        do {
            if #available(iOS 10.0, *) {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            }
            try AVAudioSession.sharedInstance().setActive(false, options: [])
            player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            player.prepareToPlay()
            player.play()
        
        } catch {
            print("Can't play sound")
        }
    }
    
}

extension SoundPlayer {
    static func optionTapSoundName() -> String {
        return "Sound_22160-Switch"
    }
    
    static func multicardTapSoundName() -> String {
        return "Sound_22160-Switch_v2"
    }
    
    static func peepSoundName() -> String {
        return "Sound-Peep"
    }
}
