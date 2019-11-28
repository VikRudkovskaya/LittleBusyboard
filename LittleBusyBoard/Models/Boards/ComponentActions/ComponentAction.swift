//
//  ComponentAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya + Troglodyte on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

protocol ComponetActionDelegate {
    func actionDidPerformed()
}

class ComponentAction: Decodable {
    // Исполнить действие
    func perform() {
        
    }
}

enum ComponentActionFamily: String, ClassFamily {
    case switchLightType = "SwitchLight"
    case playSoundType = "PlaySound"
    case backgroundChange = "BackgroundChange"
    case resizeElement = "ResizeElement"
    case rotate = "Rotate"
    case changeTexture = "ChangeTexture"
    case spawnOne = "SpawnOne"
    
    static var discriminator: Discriminator = .type
    
    func getType() -> AnyObject.Type {
        switch self {
        case .switchLightType:
            return SwitchLightAction.self
        case .playSoundType:
            return PlaySoundAction.self
        case .backgroundChange:
            return BackgroundChangeAction.self
        case .resizeElement:
            return ResizeElementAction.self
        case .rotate:
            return RotateAction.self
        case .changeTexture:
            return ChangeTextureAction.self
        case .spawnOne:
            return SpawnPlusOneTipAction.self
        }
    }
}
