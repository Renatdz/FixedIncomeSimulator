//
//  ResultCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class ResultCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let resultViewModel = ResultViewModel()
        let resultViewController = ResultViewController(viewModel: resultViewModel)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}
