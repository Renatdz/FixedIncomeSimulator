//
//  String+Extension.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 23/02/19.
//

import UIKit

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }

    var currency: String {
        let stringWithoutSymbol = self.replacingOccurrences(of: "R$", with: "")
        let stringWithoutComma = stringWithoutSymbol.replacingOccurrences(of: ".", with: "")

        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0

        if let result = NumberFormatter().number(from: stringWithoutComma) {
            return formatter.string(from: result) ?? self
        }

        return self
    }
}
