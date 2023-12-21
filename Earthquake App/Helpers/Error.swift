//
//  Error.swift
//  Earthquake App
//
//  Created by Ilyas on 17.12.2023.
//

import Foundation

public enum Error: Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}
