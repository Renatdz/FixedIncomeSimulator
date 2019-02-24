//
//  ResultCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class ResultCoordinator: Coordinator {
    var navigationController: UINavigationController
    var simulation: Simulation

    init(simulation: Simulation, navigationController: UINavigationController) {
        self.simulation = simulation
        self.navigationController = navigationController
    }

    func start() {
        let resultViewModel = ResultViewModel(simulation: simulation)
        let resultViewController = ResultViewController(viewModel: resultViewModel)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}
