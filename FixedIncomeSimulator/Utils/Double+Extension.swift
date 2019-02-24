//
//  Double+Extension.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import Foundation

extension Double {
    var currency: String {
        let locale: Locale = Locale(identifier: "pt_BR")
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(for: self) ?? ""
    }

    var percentage: String {
        let locale: Locale = Locale(identifier: "pt_BR")
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1
        return formatter.string(for: self) ?? "%"
    }
}
