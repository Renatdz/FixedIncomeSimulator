//
//  FormViewModel.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

protocol FormViewModelDelegate: class {
    func showResult(with simulation: Simulation)
}

final class FormViewModel {
    weak var delegate: FormViewModelDelegate?

    private var service: FixedIncomeService

    private var investedValue: Double = 0
    private var investimentDueDate: String = ""
    private var cdiPercentageValue: Int = 0

    private let minCurrencyRange: Int = 4
    private let maxDateRange: Int = 10
    private let minPercentageRange: Int = 2

    init(service: FixedIncomeService, delegate: FormViewModelDelegate?) {
        self.service = service
        self.delegate = delegate
    }

    func simulateIncome(investedValue: String,
                        investimentDueDate: String,
                        cdiPercentage: String,
                        completion: @escaping (PrintableError) -> Void) {
        if !isValid(investedValue: investedValue,
                    investimentDueDate: investimentDueDate,
                    cdiPercentage: cdiPercentage) {
            completion(FormError.invalidForm); return
        }

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
        delegate?.showResult(with: simulation)
//        simulateResults { [weak self] result in
//            switch result {
//            case let .success(simulation):
//                self?.delegate?.showResult(with: simulation)
//
//            case let .failure(error):
//                completion(error)
//            }
//        }
    }

    private func simulateResults(completion: @escaping (Result<Simulation>) -> Void) {
        service.simulate(investedAmount: investedValue,
                         rate: cdiPercentageValue,
                         maturityDate: investimentDueDate) { result in
                            completion(result)
        }
    }

    private func isValid(investedValue: String, investimentDueDate: String, cdiPercentage: String) -> Bool {
        guard investedValue.count >= minCurrencyRange
            && investimentDueDate.count == maxDateRange
            && cdiPercentage.count > minPercentageRange else {
                return false
        }

        var validInvestedValue = investedValue.replacingOccurrences(of: "R$", with: "")
        validInvestedValue = validInvestedValue.trimmingCharacters(in: .whitespaces)
        self.investedValue = Double(validInvestedValue) ?? 0

        self.investimentDueDate = investimentDueDate

        let validCdiPercentage = cdiPercentage.replacingOccurrences(of: "%", with: "")
        self.cdiPercentageValue = Int(validCdiPercentage) ?? 0

        return true
    }
}
