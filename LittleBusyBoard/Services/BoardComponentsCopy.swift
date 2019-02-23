
//  Created by Troglodyte a on 06/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

struct AnyTypeArrayDecoder<T> where T : Decodable {
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        init(intValue: Int) {
            self.intValue = intValue
            stringValue = "\(intValue)"
        }
        static func key(named name: String) -> CodingKeys {
            return CodingKeys(stringValue: name)
        }
    }
    
    let components: [T]
    
    init(from decoder: Decoder, valueKey valueKeyString: String, typeKey typeKeyString: String, classForType: Dictionary<AnyHashable, T.Type>) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let valueKey = CodingKeys.key(named: valueKeyString)
        let typeKey = CodingKeys.key(named: typeKeyString)
        var componentsForType = try container.nestedUnkeyedContainer(forKey: valueKey) // список из которого парсится тип
        var components = [T]()
        var componetsForData = componentsForType // список из которого парсится объект
        while(!componentsForType.isAtEnd) {
            /*
             * nestedContainer и decode сдвигают текущий индекс списка на котором они были вызваны
             * поэтому если вызывать их на одном и том же списке, то возвращаться будут
             * разные объекты (сначала по индексу i, затем по индексу i+1)
             */
            let component = try componentsForType.nestedContainer(keyedBy: CodingKeys.self)

            let type = try component.decode(String.self, forKey: typeKey)
            guard let elementType = classForType[type] else {
                throw DecodingError.valueNotFound(String.self, DecodingError.Context(codingPath: [], debugDescription: "Test desc."))
            }
            components.append(try componetsForData.decode(elementType))
        }
        self.components = components
    }
}
