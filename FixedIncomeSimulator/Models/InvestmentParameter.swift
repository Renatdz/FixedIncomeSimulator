//
//  InvestmentParameter.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import Foundation

struct InvestmentParameter: Codable {
    let investedAmount: Double
    let yearlyInterestRate: Double
    let maturityTotalDays: Int
    let maturityBusinessDays: Int
    let maturityDate: String
    let rate: Double
    let isTaxFree: Bool

    enum CodingKeys: String, CodingKey {
        case investedAmount
        case yearlyInterestRate
        case maturityTotalDays
        case maturityBusinessDays
        case maturityDate
        case rate
        case isTaxFree
    }

    init(investedAmount: Double,
         yearlyInterestRate: Double,
         maturityTotalDays: Int,
         maturityBusinessDays: Int,
         maturityDate: String,
         rate: Double,
         isTaxFree: Bool) {
        self.investedAmount = investedAmount
        self.yearlyInterestRate = yearlyInterestRate
        self.maturityTotalDays = maturityTotalDays
        self.maturityBusinessDays = maturityBusinessDays
        self.maturityDate = maturityDate
        self.rate = rate
        self.isTaxFree = isTaxFree
    }
}
