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
        
        var boardsGroups: [BusyboardsGroup]? = nil
        do {
            guard let jsonData1 = Utils.unarchiveJSON(from: "RU_BoardsGroup_1") else {
                fatalError("Файл с указанным именем не найден")
            }
            let busyboardsGroup1 = try JSONDecoder().decode(BusyboardsGroup.self, from: jsonData1)
            
            guard let jsonData2 = Utils.unarchiveJSON(from: "RU_BoardsGroup_2") else {
                fatalError("Файл с указанным именем не найден")
            }
            let busyboardsGroup2 = try JSONDecoder().decode(BusyboardsGroup.self, from: jsonData2)
            
            boardsGroups = [busyboardsGroup1, busyboardsGroup2]
            f(busyboardGroup: busyboardsGroup2)
            
            

            
        } catch  {
            print("Decode Error:\n", error)
        }
        self.busyboardsGroups = boardsGroups
        completion(boardsGroups)
        
        // Лес, единороги, замки, облака, квадраты, рубчик, звезды
    }
    
    func f(busyboardGroup: BusyboardsGroup) {
        for board in busyboardGroup.boards! {
            for component in board.boardComponents! {
                for action in component.actions! {
                    if action is RotateAction {
                        let rotateAction = action as! RotateAction
                        rotateAction.affectedBoardComponent = component
                    }
                }
            }
        }
    }
    
    
}
