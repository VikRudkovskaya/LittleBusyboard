//
//  Utils.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func random(_ n:Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    static func unarchiveJSON(from fileName: String) -> Data? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            return jsonData
        } catch {
            print("UnarhiveJSON Error: ", error)
            return nil
        }
    }
    
}