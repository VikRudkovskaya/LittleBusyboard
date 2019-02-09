//
//  BoardComponents.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 06/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit
/*
 * Промежуточный компонент для декода массива,
 * содержащего объекты разного типа (разные типы компонентов доски)
 */
struct BoardComponents: Decodable {
    
    let components: [BoardComponent]
    
    enum ComponentKey: CodingKey {
        case components
    }
    
    enum ComponentTypeKey: CodingKey {
        case type
    }
    
    enum ComponentType: String, Decodable {
        case buttonType = "Button"
        case switchType = "Switch"
        case bulbType = "LightBulb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ComponentKey.self)
        var componentsForType = try container.nestedUnkeyedContainer(forKey: ComponentKey.components) // список из которого парсится тип
        var components = [BoardComponent]()
        var componetsForData = componentsForType // список из которого парсится объект
        while(!componentsForType.isAtEnd) {
            /*
             * nestedContainer и decode сдвигают текущий индекс списка на котором они были вызваны
             * поэтому если вызывать их на одном и том же списке, то возвращаться будут
             * разные объекты (сначала по индексу i, затем по индексу i+1)
             */
            let component = try componentsForType.nestedContainer(keyedBy: ComponentTypeKey.self)

            let type = try component.decode(ComponentType.self, forKey: ComponentTypeKey.type)
            switch type {
            case .buttonType:
                components.append(try componetsForData.decode(ButtonComponent.self))
            case .switchType:
                components.append(try componetsForData.decode(SwitchComponent.self))
            case .bulbType:
                components.append(try componetsForData.decode(LightbulbComponent.self))
            }
        }
        self.components = components
    }
    
}
