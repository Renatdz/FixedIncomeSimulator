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

    func start() -> UIViewController {
        let formCoordinator = FormCoordinator(navigationController: navigationController)
        formCoordinator.start()
        currentCoordinator = formCoordinator
        return navigationController
    }
}
