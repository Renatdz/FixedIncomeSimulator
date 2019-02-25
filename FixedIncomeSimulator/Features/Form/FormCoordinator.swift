//
//  FormCoordinator.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var childCoordinator: Coordinator?

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
        let investmentParameter = InvestmentParameter(investedAmount: 32323.0,
                                                      yearlyInterestRate: 9.5512,
                                                      maturityTotalDays: 1981,
                                                      maturityBusinessDays: 1409,
                                                      maturityDate: "2023-03-03T00:00:00",
                                                      rate: 123.0,
                                                      isTaxFree: false)
        let simulation = Simulation(investmentParameter: investmentParameter,
                                    grossAmount: 60528.20,
                                    taxesAmount: 4230.78,
                                    netAmount: 56297.42,
                                    grossAmountProfit: 28205.20,
                                    netAmountProfit: 23974.42,
                                    annualGrossRateProfit: 87.26,
                                    monthlyGrossRateProfit: 0.76,
                                    dailyGrossRateProfit: 0.000445330025305748,
                                    taxesRate: 15.7,
                                    rateProfit: 9.5512,
                                    annualNetRateProfit: 74.17)
        let resultCoordinator = ResultCoordinator(simulation: simulation, navigationController: navigationController)
        resultCoordinator.start()
        childCoordinator = resultCoordinator
    }
}
