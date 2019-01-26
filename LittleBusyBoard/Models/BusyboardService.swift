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
        board1.boardDescription = "Самый простой, но не менее эффективный, бизиборб"
        
        let board2 = Busyboard()
        board2.name = "Тестовый"
        board2.boardDescription = "Просто тестовый, здесь, возможно, еще ничего нет"
        
        return [board1, board2]
    }
}
