//
//  Simulation.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import Foundation

struct Simulation: Codable {
    let investmentParameter: InvestmentParameter
    let grossAmount: Double
    let taxesAmount: Double
    let netAmount: Double
    let grossAmountProfit: Double
    let netAmountProfit: Double
    let annualGrossRateProfit: Double
    let monthlyGrossRateProfit: Double
    let dailyGrossRateProfit: Double
    let taxesRate: Double
    let rateProfit: Double
    let annualNetRateProfit: Double

    enum CodingKeys: String, CodingKey {
        case investmentParameter
        case grossAmount
        case taxesAmount
        case netAmount
        case grossAmountProfit
        case netAmountProfit
        case annualGrossRateProfit
        case monthlyGrossRateProfit
        case dailyGrossRateProfit
        case taxesRate
        case rateProfit
        case annualNetRateProfit
    }

    init(investmentParameter: InvestmentParameter,
         grossAmount: Double,
         taxesAmount: Double,
         netAmount: Double,
         grossAmountProfit: Double,
         netAmountProfit: Double,
         annualGrossRateProfit: Double,
         monthlyGrossRateProfit: Double,
         dailyGrossRateProfit: Double,
         taxesRate: Double,
         rateProfit: Double,
         annualNetRateProfit: Double) {
        self.investmentParameter = investmentParameter
        self.grossAmount = grossAmount
        self.taxesAmount = taxesAmount
        self.netAmount = netAmount
        self.grossAmountProfit = grossAmountProfit
        self.netAmountProfit = netAmountProfit
        self.annualGrossRateProfit = annualGrossRateProfit
        self.monthlyGrossRateProfit = monthlyGrossRateProfit
        self.dailyGrossRateProfit = dailyGrossRateProfit
        self.taxesRate = taxesRate
        self.rateProfit = rateProfit
        self.annualNetRateProfit = annualNetRateProfit
    }
}
