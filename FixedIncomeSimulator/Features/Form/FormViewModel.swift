//
//  FormViewModel.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

protocol FormViewModelDelegate: class {
    func showResult()
}

final class FormViewModel {
    weak var delegate: FormViewModelDelegate?

    private var investedValue: Double = 0
    private var investimentDueDate: String = ""
    private var cdiPercentageValue: Double = 0

    private let minCurrencyRange: Int = 4
    private let maxDateRange: Int = 10
    private let minPercentageRange: Int = 2

    init(delegate: FormViewModelDelegate?) {
        self.delegate = delegate
    }

    func simulateIncome(investedValue: String,
                        investimentDueDate: String,
                        cdiPercentage: String,
                        completion: (PrintableError) -> Void) {
        if !isValid(investedValue: investedValue,
                    investimentDueDate: investimentDueDate,
                    cdiPercentage: cdiPercentage) {
            completion(FormError.invalidForm)
        }

        // call service

        // call coordinator
        delegate?.showResult()
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
        self.cdiPercentageValue = Double(validCdiPercentage) ?? 0

        return true
    }
}