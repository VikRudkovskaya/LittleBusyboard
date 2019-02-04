//
//  Component.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

protocol BoardComponent: class {
    
    func view() -> UIView
    
    // Каждый компонент должен знать координаты, где он находится на борде
    // Координаты центра
    var coordinates: CGPoint {get set}
    
    // Размер элемента
    
    // Есть своя зона влиянияния (зона в которой элелемент может аффектить другие), в которой может перемещаться
    var affectZone: CGRect? {get set}
    
    // У элемента может быть последовательность действий
    var actions: [ComponentAction]? {get set}
    
    // Одновременно или последовательно воспроизводить действия
}

