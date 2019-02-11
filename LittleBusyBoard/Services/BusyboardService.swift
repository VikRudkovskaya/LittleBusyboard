//
//  BusyboardService.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardService: NSObject {
    
    var busyboardsGroups: [BusyboardsGroup]?
    
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
    func busyboards(completion:@escaping ([BusyboardsGroup]?) -> () ) -> () {
        
        guard let jsonData = Utils.unarchiveJSON(from: "BoardsGroup_1") else {
            fatalError("Файл с указанным именем не найден")
        }
        var boardsGroups: [BusyboardsGroup]? = nil
        do {
            let busyboardsGroup = try JSONDecoder().decode(BusyboardsGroup.self, from: jsonData)
            boardsGroups = [busyboardsGroup]
        } catch  {
            print("Decode Error: ", error)
        }
        self.busyboardsGroups = boardsGroups
        completion(boardsGroups)
        
        // Лес, единороги, замки, облака, квадраты, рубчик, звезды
    }
}
