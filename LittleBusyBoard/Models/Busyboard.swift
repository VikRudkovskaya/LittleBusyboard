//
//  Busyboard.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class Busyboard: NSObject {
    
    var name: String = "Бизиборд"
    
    var boardDescription = "Этот потрясающий бизиборд"
    
    private var _miniatureName: String?
    var miniatureName: String {
        get {
            guard let value = _miniatureName else {
                // Рандомный выбор значения по-умолчанию
                let unknownMiniatures = ["miniature_unknown", "miniature_unknown_2"]
                return unknownMiniatures[Utils.random(unknownMiniatures.count)]
            }
            return value
        }
        set(val) {
            _miniatureName = val
        }
    }
    
    var background: Background?
    
    // Размер доски
    var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    // Набор компонентов борды
    var boardComponents: [BoardComponent]?
    
    // перемещение компонента с заданным id -> вызов лэйаутера
    
}
