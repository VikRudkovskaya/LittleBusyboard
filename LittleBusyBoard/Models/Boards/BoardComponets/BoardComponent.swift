//
//  Component.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

enum ActionPerformMode: String, Decodable {
    case oneByOne = "OneByOne" // оно за другим при каждом нажатии
    case inSeries = "InSeries" // друг за другом за одно нажатие. Наприемер, сначала проиграть один звук, затем включить лампочки,
    case simultaneously = "Simultaneously" // Все одновременно сразу. Например, воспроизвести одновременно несколько звуков, включить лампочки и переместиться в пространстве
}

class BoardComponent: Decodable {
    
    var _view: UIView?
    func view() -> UIView {
        guard let value = _view else {
            _view = UIView(frame: .zero)
            return UIView(frame: .zero)
        }
        return value
    }
    
    var identifier: Int
    
    
    // Каждый компонент должен знать координаты, где он находится на борде
    // Координаты центра
    var coordinates: CGPoint = .zero
    
    // Размер элемента
    
    // Есть своя зона влиянияния (зона в которой элелемент может аффектить другие), в которой может перемещаться
    var affectZone: CGRect?
    
    // У элемента может быть последовательность действий
    var actions: [ComponentAction]?
    
    // Одновременно или последовательно сразу воспроизводить действия, или последовательно при каждом нажатии
    // Компонент должен знать в каком моде ему воспроизводить action'ы
    var perfomMode: ActionPerformMode
    
    private enum CodingKeys: String, CodingKey {
        case perfomMode = "actionMode"
        case actions
        case identifier
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.perfomMode = try container.decode(ActionPerformMode.self, forKey: .perfomMode)
        self.actions = try container.decode(ComponentActionFamily.self, forKey: .actions)
        self.identifier = try container.decode(Int.self, forKey: .identifier)
    }
    

}

enum BoardComponentFamily: String, ClassFamily {
    case buttonType = "Button"
    case switchType = "Switch"
    case bulbType = "LightBulb"
    
    static var discriminator: Discriminator = .type
    
    func getType() -> AnyObject.Type {
        switch self {
        case .buttonType:
            return ButtonComponent.self
        case .switchType:
            return SwitchComponent.self
        case .bulbType:
            return LightbulbComponent.self
        }
    }
}

