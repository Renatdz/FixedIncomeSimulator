//
//  SimulateEndpoint.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class SimulateEndpointTests: QuickSpec {
    override func spec() {
        describe("SimulateEndpointTests") {
            var sut: SimulateEndpoint!

            beforeEach {
                sut = SimulateEndpoint(investedAmount: 1000.0, rate: 123, maturityDate: "2023-19-12")
            }

            context("when instantiated") {
                it("should return right values") {
                    expect(sut.method) == MethodHTTP.get
                    expect(sut.parameterEncoding) == ParameterEncoding.url
                }
            }
        }
    }
}
