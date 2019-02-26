//
//  AppCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }

    func start()
}

final class AppCoordinator {
    private var currentCoordinator: Coordinator?
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    private let baseURL: String = "https://api-simulator-calc.easynvest.com.br"

    private lazy var apiClient: APIClient = APIClientBuilder(baseURL: baseURL)
        .withErrorHandler()
        .build()

    private lazy var serviceFactory: ServiceFactory = APIServiceFactory(apiClient: apiClient)

    init(serviceFactory: ServiceFactory? = nil) {
        if let serviceFactory = serviceFactory {
            self.serviceFactory = serviceFactory
        }
    }

    func start() -> UIViewController {
        let formCoordinator = FormCoordinator(service: serviceFactory.getFixedIncomeService(),
                                              navigationController: navigationController)
        formCoordinator.start()
        currentCoordinator = formCoordinator
        return navigationController
    }
}
