//
//  AppCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

public protocol Coordinator: class {
    var navigationController: UINavigationController { get set }

    func start()
}

final class AppCoordinator {
    private let navigationController: UINavigationController = UINavigationController()

    func start() -> UIViewController {
        let formCoordinator = FormCoordinator(navigationController: navigationController)
        formCoordinator.start()
        return navigationController
    }
}
