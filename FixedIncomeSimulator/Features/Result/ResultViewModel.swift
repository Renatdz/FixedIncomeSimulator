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

    private let investedAmountDescription: String = "Valor aplicado inicialmente"
    private var investedAmount: String
    private let grossAmountDescription: String = "Valor bruto do investimento"
    private(set) var grossAmount: String
    private let grossAmountProfitDescription: String = "Valor do rendimento"
    private(set) var grossAmountProfit: String
    private let taxesAmountWithPercentageDescription: String = "IR sobre o investimento"
    private var taxesAmountWithPercentage: String
    private let netAmountDescription: String = "Valor líquido do investimento"
    private var netAmount: String
    private let maturityDateDescription: String = "Data de resgate"
    private var maturityDate: String
    private let maturityTotalDaysDescription: String = "Dias corridos"
    private var maturityTotalDays: String
    private let monthlyGrossRateProfitDescription: String = "Rendimento mensal"
    private var monthlyGrossRateProfit: String
    private let cdiPercentageDescription: String = "Percentual do CDI do investimento"
    private var cdiPercentage: String
    private let yearlyInterestRateDescription: String = "Rentabilidade anual"
    private var yearlyInterestRate: String
    private let periodRateProfitDescription: String = "Rentabilidade no período"
    private var periodRateProfit: String

    private(set) var matrixValues: [[String]] = [[]]

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

        matrixValues.append([investedAmountDescription, investedAmount])
        matrixValues.append([grossAmountDescription, grossAmount])
        matrixValues.append([grossAmountProfitDescription, grossAmountProfit])
        matrixValues.append([taxesAmountWithPercentageDescription, taxesAmountWithPercentage])
        matrixValues.append([netAmountDescription, netAmount])
        matrixValues.append(["", ""])
        matrixValues.append(["", ""])
        matrixValues.append([maturityDateDescription, maturityDate])
        matrixValues.append([maturityTotalDaysDescription, maturityTotalDays])
        matrixValues.append([monthlyGrossRateProfitDescription, monthlyGrossRateProfit])
        matrixValues.append([cdiPercentageDescription, cdiPercentage])
        matrixValues.append([yearlyInterestRateDescription, yearlyInterestRate])
        matrixValues.append([periodRateProfitDescription, periodRateProfit])

        self.delegate = delegate
    }

    func showForm() {
        delegate?.showForm()
    }
}
