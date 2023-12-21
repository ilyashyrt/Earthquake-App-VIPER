//
//  ApiService.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation
import Alamofire

protocol ApiServiceProtocol {
    func fetchEarthquake(completion: @escaping (DataResult<Earthquake>) -> Void)
}

class ApiService: ApiServiceProtocol {
    
    func fetchEarthquake(completion: @escaping (DataResult<Earthquake>) -> Void) {
        AF.request(AppConstants.apiUrl).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Earthquake.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
