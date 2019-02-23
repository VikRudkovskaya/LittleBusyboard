//
//  LightbulbComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class LightbulbComponent: NSObject, BoardComponent  {
    var perfomMode: ActionPerformMode = .inSeries
    
    func view() -> UIView {
        let imageView = UIImageView()
        
        let imagesNames = ["bulb_on_1", "bulb_on_2", "bulb_on_3", "bulb_off"];
        var images = [UIImage]()
        for imageName in imagesNames {
            guard let image = UIImage(named: imageName) else {
                continue
            }
            images.append(image)
        }
        
        imageView.animationImages = images
        return imageView
    }
    
    var coordinates: CGPoint = CGPoint(x: 0, y: 0)
    
    var affectZone: CGRect?
    
    var actions: [ComponentAction]?
    
    var onTextureName: String = "button_bulb_1"
    
    var offTextureName: String = "button_bulb_1"
    
    var currentTextureName: String {
        if on {
            return onTextureName
        }
        return offTextureName
    }
    
    var on: Bool = false

}
