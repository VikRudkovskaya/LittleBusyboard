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
    
    // Получить доступные доски
    func busyboards(completion:@escaping ([Busyboard]?) -> () ) -> () {
        busyboards = localBusyboards()
        completion(busyboards)
    }

    private func localBusyboards() -> [Busyboard] {
        let board1 = Busyboard()
        board1.name = "Однокнопочный"
        board1.boardDescription = "Самый простой, но не менее эффективный, бизиборд"
        board1.miniatureName = "miniature_v1"
        
        let button1 = ButtonComponent()
        button1.textureName = "button_green-blue"
        let soundAction = PlaySoundAction(soundID: 1025)
        button1.actions = [soundAction]
        
        board1.boardComponents = [button1]
        
        let board2 = Busyboard()
        board2.name = "Тестовый"
        board2.boardDescription = "Просто тестовый, здесь, возможно, еще ничего нет"
        
        let board3 = Busyboard()
        board3.name = "Звездный"
        
        return [board1]
    }
}
