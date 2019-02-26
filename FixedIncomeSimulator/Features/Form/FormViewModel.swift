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

        simulateResults { [weak self] result in
            switch result {
            case let .success(simulation):
                self?.delegate?.showResult(with: simulation)

            case let .failure(error):
                completion(error)
            }
        }
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

        self.investedValue = investedValue.systemCurrency

        self.investimentDueDate = investimentDueDate.systemDateFormat

        let validCdiPercentage = cdiPercentage.replacingOccurrences(of: "%", with: "")
        self.cdiPercentageValue = Int(validCdiPercentage) ?? 0

        return true
    }
}
