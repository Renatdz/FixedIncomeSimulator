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
        let formViewModel = FormViewModel()
        let formViewController = FormViewController(viewModel: formViewModel)
        navigationController.pushViewController(formViewController, animated: true)
    }
}
