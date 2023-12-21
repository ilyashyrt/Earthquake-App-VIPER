//
//  EarthquakeListRouter.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

class EarthquakeListRouter: PresenterToRouterEarthquakeListProtocol {
    static func createModule(ref: EarthquakeListViewController) {
        let presenter = EarthquakeListPresenter()
        ref.presenter = presenter
        ref.presenter?.interactor = EarthquakeListInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
}
