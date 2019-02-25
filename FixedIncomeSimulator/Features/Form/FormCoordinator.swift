//
//  FormCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormCoordinator: Coordinator {
    private var service: FixedIncomeService
    var navigationController: UINavigationController
    private var childCoordinator: Coordinator?

    init(service: FixedIncomeService, navigationController: UINavigationController) {
        self.service = service
        self.navigationController = navigationController
    }

    func start() {
        let formViewModel = FormViewModel(service: service, delegate: self)
        let formViewController = FormViewController(viewModel: formViewModel)
        navigationController.pushViewController(formViewController, animated: true)
    }
}

// MARK: - FormViewModelDelegate
extension FormCoordinator: FormViewModelDelegate {
    func showResult(with simulation: Simulation) {
        print("SIMULATION HERE MODAFOCKA ---- \(simulation)")
        
        let resultCoordinator = ResultCoordinator(simulation: simulation,
                                                  service: service,
                                                  navigationController: navigationController)
        resultCoordinator.start()
        childCoordinator = resultCoordinator
    }
}
