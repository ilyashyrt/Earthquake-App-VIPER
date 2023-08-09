//
//  DataResult.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

public enum DataResult<Value> {
    case success(Value)
    case failure(Error)
}
