//
//  MixedArrayDecoder.swift
//  LittleBusyboard
//
//  Created by Nikita Ruzanov on 22/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

enum Discriminator: String, CodingKey {
    case type = "type"
}

protocol ClassFamily: Decodable {
    /// The discriminator key.
    static var discriminator: Discriminator { get }
    
    /// Returns the class type of the object coresponding to the value.
    func getType() -> AnyObject.Type
}

class ClassWrapper<T: ClassFamily, U: Decodable>: Decodable {
    /// The family enum containing the class information.
    let family: T
    // The decoded object. Can be any subclass of U.
    let object: U?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: type(of: T.discriminator))
        // Decode the family with the discriminator.
        family = try container.decode(T.self, forKey: T.discriminator)
        // Decode the object by initialising the corresponding type.
        if let type = family.getType() as? U.Type {
            object = try type.init(from: decoder)
        } else {
            object = nil
        }
    }
}

extension JSONDecoder {
    /// Decode a heterogeneous list of objects.
    /// - Parameters:
    ///     - family: The ClassFamily enum type to decode with.
    ///     - data: The data to decode.
    /// - Returns: The list of decoded objects.
    func decode<T: ClassFamily, U: Decodable>(family: T.Type, from data: Data) throws -> [U] {
        return try self.decode([ClassWrapper<T, U>].self, from: data).compactMap { $0.object }
    }
}

extension KeyedDecodingContainer {
    func decode<T: ClassFamily, U: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [U] {
        return try self.decode([ClassWrapper<T, U>].self, forKey: key).compactMap { $0.object }
    }
}
