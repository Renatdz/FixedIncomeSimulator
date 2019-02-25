//
//  FixedIncomeServiceTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class FixedIncomeServiceTests: QuickSpec {
    override func spec() {
        describe("FixedIncomeServiceTests") {
            var sut: DefaultFixedIncomeService!
            let apiClientMock = APIClientFixedIncomeMock()

            beforeEach {
                sut = DefaultFixedIncomeService(apiClient: apiClientMock)
            }

            context("When simulate is called") {
                context("When it success") {
                    beforeEach {
                        sut.simulate(investedAmount: 1000.0, rate: 122, maturityDate: "2023-10-12") { _ in }
                    }

                    it("Should show correct endpoints") {
                        expect(apiClientMock.endpoints.removeFirst()).to(beAKindOf(SimulateEndpoint.self))
                    }
                }
            }
        }
    }
}
