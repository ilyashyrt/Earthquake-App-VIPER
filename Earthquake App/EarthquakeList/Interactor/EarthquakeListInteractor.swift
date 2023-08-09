//
//  EarthquakeListInteractor.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

class EarthquakeListInteractor: PresenterToInteractorEarthquakeListProtocol {
    var presenter: InteractorToPresenterEartquakeListProtocol?
    
    func load() {
        presenter?.isLoading(true)
        ApiService().fetchEarthquake { result in
            self.presenter?.isLoading(false)
            switch result {
            case .success(let earthquake):
                self.presenter?.sendDataToPresenter(earthquake)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
