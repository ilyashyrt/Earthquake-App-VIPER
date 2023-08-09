//
//  Earthquake.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

//MARK: - Earthquake
struct Earthquake: Codable {
    let result: [Result]
}

//MARK: - Result
struct Result: Codable {
    let title: String
    let date: String
    let mag, depth: Double
    let geojson: Geojson
}

//MARK: - Geojson
struct Geojson: Codable {
    let type: TypeEnum
    let coordinates: [Double]
}

enum TypeEnum: String, Codable {
    case point = "Point"
}
