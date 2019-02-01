//
//  Component.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit



class BoardComponent: NSObject {
    // Каждый компонент должен знать координаты, где он находится на борде
    // Координаты центра
    var coordinates: CGPoint = CGPoint(x:0, y: 0)
    
    // Размер элемента
    
    // Есть своя зона влиянияния (зона в которой элелемент может аффектить другие), в которой может перемещаться
    var affectZone: CGRect?
    
    
    // У элемента может быть последовательность действий
    var actions: [ComponentAction]?
    
}

