//
//  SimulationMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

@testable import FixedIncomeSimulator

extension Simulation {
    static func result() -> Simulation {
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
        return simulation
    }
}
