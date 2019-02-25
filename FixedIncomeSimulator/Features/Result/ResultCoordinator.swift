//
//  ResultCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class ResultCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var childCoordinator: Coordinator?
    private var simulation: Simulation
    private var service: FixedIncomeService

    init(simulation: Simulation, service: FixedIncomeService, navigationController: UINavigationController) {
        self.simulation = simulation
        self.service = service
        self.navigationController = navigationController
    }

    func start() {
        let resultViewModel = ResultViewModel(simulation: simulation, delegate: self)
        let resultViewController = ResultViewController(viewModel: resultViewModel)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}

extension ResultCoordinator: ResultViewModelDelegate {
    func showForm() {
        let formCoordinator = FormCoordinator(service: service, navigationController: navigationController)
        formCoordinator.start()
        childCoordinator = formCoordinator
    }
}
