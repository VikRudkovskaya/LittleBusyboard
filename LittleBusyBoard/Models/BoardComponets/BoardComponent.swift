//
//  Component.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

enum ActionPerformMode: String, Decodable {
    case oneByOne // оно за другим при каждом нажатии
    case inSeries // друг за другом за одно нажатие. Наприемер, сначала проиграть один звук, затем включить лампочки,
    case simultaneously // Все одновременно сразу. Например, воспроизвести одновременно несколько звуков, включить лампочки и переместиться в пространстве
}

protocol BoardComponent: Decodable {
    
    func view() -> UIView
    
    // Каждый компонент должен знать координаты, где он находится на борде
    // Координаты центра
    var coordinates: CGPoint {get set}
    
    // Размер элемента
    
    // Есть своя зона влиянияния (зона в которой элелемент может аффектить другие), в которой может перемещаться
    var affectZone: CGRect? {get set}
    
    // У элемента может быть последовательность действий
    var actions: [ComponentAction]? {get set}
    
    // Одновременно или последовательно сразу воспроизводить действия, или последовательно при каждом нажатии
    // Компонент должен знать в каком моде ему воспроизводить action'ы
    var perfomMode: ActionPerformMode {get set}
}

