//
//  EarthquakeListProtocols.swift
//  Earthquake App
//
//  Created by Ilyas on 3.08.2023.
//

import Foundation

//MARK: - View
protocol PresenterToViewEarthquakeListProtocol {
    func sendDataToView(_ earthquake: Earthquake)
    func isLoading(_ isLoading: Bool)
}

//MARK: - Presenter
protocol ViewToPresenterEarthquakeListProtocol {
    var interactor: PresenterToInteractorEarthquakeListProtocol? {get set}
    var view: PresenterToViewEarthquakeListProtocol? {get set}
    func load()
}

//MARK: - Interactor
protocol PresenterToInteractorEarthquakeListProtocol {
    var presenter: InteractorToPresenterEartquakeListProtocol? {get set}
    func load()
}

protocol InteractorToPresenterEartquakeListProtocol {
    func sendDataToPresenter(_ earthquake: Earthquake)
    func isLoading(_ isLoading: Bool)
}

//MARK: - Router
protocol PresenterToRouterEarthquakeListProtocol {
    static func createModule(ref: EarthquakeListViewController)
}
