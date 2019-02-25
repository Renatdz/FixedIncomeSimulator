//
//  ResultViewModel.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

protocol ResultViewModelDelegate: class {
    func showForm()
}

final class ResultViewModel {
    weak var delegate: ResultViewModelDelegate?

    private(set) var investedAmount: String
    private(set) var grossAmount: String
    private(set) var grossAmountProfit: String
    private(set) var taxesAmountWithPercentage: String
    private(set) var netAmount: String
    private(set) var maturityDate: String
    private(set) var maturityTotalDays: String
    private(set) var monthlyGrossRateProfit: String
    private(set) var cdiPercentage: String
    private(set) var yearlyInterestRate: String
    private(set) var periodRateProfit: String

    init(simulation: Simulation, delegate: ResultViewModelDelegate) {
        investedAmount = simulation.investmentParameter.investedAmount.currency
        grossAmount = simulation.grossAmount.currency
        grossAmountProfit = simulation.grossAmountProfit.currency
        taxesAmountWithPercentage = "\(simulation.taxesAmount.currency)(\(simulation.taxesRate.percentage))"
        netAmount = simulation.netAmount.currency
        maturityDate = simulation.investmentParameter.maturityDate.brazilianDateFormat
        maturityTotalDays = "\(simulation.investmentParameter.maturityTotalDays)"
        monthlyGrossRateProfit = simulation.monthlyGrossRateProfit.percentage
        cdiPercentage = simulation.investmentParameter.rate.percentage
        yearlyInterestRate = simulation.investmentParameter.yearlyInterestRate.percentage
        periodRateProfit = simulation.rateProfit.percentage

        self.delegate = delegate
    }

    func showForm() {
        delegate?.showForm()
    }
}
