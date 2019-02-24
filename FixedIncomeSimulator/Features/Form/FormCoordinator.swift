//
//  FormCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let formViewModel = FormViewModel(delegate: self)
        let formViewController = FormViewController(viewModel: formViewModel)
        navigationController.pushViewController(formViewController, animated: true)
    }
}

// MARK: - FormViewModelDelegate
extension FormCoordinator: FormViewModelDelegate {
    func showResult() {
        let resultCoordinator = ResultCoordinator(navigationController: navigationController)
        resultCoordinator.start()
    }
}
