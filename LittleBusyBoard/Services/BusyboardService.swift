//
//  BusyboardService.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardService: NSObject {
    
    var busyboards: [Busyboard]?
    
    var availableBackgrouns: [Background] {
        get {
            guard let json = Utils.unarchiveJSON(from: "Backgrounds") else {
                fatalError()
            }
            
            do {
                let backgrounds = try JSONDecoder().decode([Background].self, from: json)
                return backgrounds
            } catch  {
                print("Decode Error: ", error)
                var defaultBg = Background()
                defaultBg.fileName = "bg_tiny_rounds"
                return [defaultBg]
            }
        }
    }
    
    var availableSystemSounds: [SystemSound] {
        get {
            guard let json = Utils.unarchiveJSON(from: "SystemSoundsIDs") else {
                fatalError("Файл с указанным именем не найден")
            }
            
            do {
                let systemSounds = try JSONDecoder().decode([SystemSound].self, from: json)
                return systemSounds
            } catch  {
                print("Decode Error: ", error)
                let defaultSystemSound = SystemSound(soundID: 1000, fileName: nil, category: nil)
                
                return [defaultSystemSound]
            }
        }
    }
    
    // Получить доступные доски
    func busyboards(completion:@escaping ([Busyboard]?) -> () ) -> () {
        busyboards = localBusyboards()
        completion(busyboards)
    }

    private func localBusyboards() -> [Busyboard] {
        
        let background = availableBackgrouns[Utils.random(availableBackgrouns.count)]
        let board1 = Busyboard(background: background)
        board1.name = "Однокнопочный"
        board1.boardDescription = "Самый простой, но не менее эффективный, бизиборд"
        board1.miniatureName = "miniature_v1"
        
        let button1 = ButtonComponent()
        button1.textureName = "button_green-blue"
        let sysSound1 = availableSystemSounds[Utils.random(availableSystemSounds.count)]
        let sysSound2 = availableSystemSounds[Utils.random(availableSystemSounds.count)]
        let soundAction1 = PlaySoundAction(systemSound: sysSound1)
        let soundAction2 = PlaySoundAction(systemSound: sysSound2)
        button1.actions = [soundAction1]
        
        board1.boardComponents = [button1]
        
        
        
        let board2 = Busyboard(background: background)
        board2.name = "Тестовый"
        board2.boardDescription = "Просто тестовый, здесь, возможно, еще ничего нет"
        
        let board3 = Busyboard(background: background)
        board3.name = "Звездный"
        
        // Лес, единороги, замки, облака, квадраты, рубчик
        
        return [board1]
    }
}
