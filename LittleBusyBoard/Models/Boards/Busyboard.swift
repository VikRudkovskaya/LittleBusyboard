//
//  Busyboard.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class Busyboard: Decodable {
    
    var name: String = "Бизиборд"
    
    var boardDescription: String?
    
    var isRandom: Bool = false // какие именно парам рандомизируются
    
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
    
    var background: Background
    
    // Размер доски
    var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    // Набор компонентов борды
    var boardComponents: [BoardComponent]?
    
    // перемещение компонента с заданным id -> вызов лэйаутера
    
    init(background: Background) {
        self.background = background
    }
    
    enum CodingKeys : String, CodingKey {
        case name
        case boardDescription
        case isRandom
        case _miniatureName = "miniatureName"
        case background
        case boardComponents = "components"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.boardDescription = try container.decodeIfPresent(String.self, forKey: .boardDescription)
        self.isRandom = try container.decode(Bool.self, forKey: .isRandom)
        self._miniatureName = try container.decodeIfPresent(String.self, forKey: ._miniatureName)
        self.background = try container.decode(Background.self, forKey: .background)
        
        self.boardComponents = try container.decode(BoardComponentFamily.self, forKey: .boardComponents)
    }
}
