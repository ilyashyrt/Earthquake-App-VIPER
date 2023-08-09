//
//  EarthquakeListPresenter.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

class EarthquakeListPresenter: ViewToPresenterEarthquakeListProtocol {
    
    var interactor: PresenterToInteractorEarthquakeListProtocol?
    
    var view: PresenterToViewEarthquakeListProtocol?
    
    func load() {
        interactor?.load()
    }
    
    
}

extension EarthquakeListPresenter: InteractorToPresenterEartquakeListProtocol {
    func sendDataToPresenter(_ earthquake: Earthquake) {
        view?.sendDataToView(earthquake)
    }
    
    func isLoading(_ isLoading: Bool) {
        view?.isLoading(isLoading)
    }
    
    
}
