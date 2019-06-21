//
//  BusyboardService.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardService {
    
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
        
        busyboardsGroups = []
        do {
            let languageCode = Utils.languageCode()
            let indexes = ["1", "3", "2"]
            for index in indexes {
                let fileName = languageCode.appendingFormat("_BoardsGroup_\(index)") // Example - en_BoardsGroup_1
                guard let jsonData = Utils.unarchiveJSON(from: fileName) else {
                    fatalError("Файл с указанным именем не найден")
                }
                let busyboardsGroup = try JSONDecoder().decode(BusyboardsGroup.self, from: jsonData)
                busyboardsGroups!.append(busyboardsGroup)
                f(busyboardGroup: busyboardsGroup)
            }

        } catch  {
            print("Decode Error:\n", error)
        }
        completion(busyboardsGroups)
    }
    
    // т.к. хранится только id компонента, то необходимо запинить саму модель компонента по известному id
    func f(busyboardGroup: BusyboardsGroup) {
        for board in busyboardGroup.boards! {
            for component in board.boardComponents! {
                for action in component.actions! {
                    
                    switch action {
                    case is RotateAction:
                        let rotateAction = action as! RotateAction
                        rotateAction.affectedBoardComponent = component
                    case is ChangeTextureAction:
                        let changeTextureAction = action as! ChangeTextureAction
                        changeTextureAction.affectedBoardComponent = component
                    default: break
                    }
  
                }
            }
        }
    }
    
    
}
