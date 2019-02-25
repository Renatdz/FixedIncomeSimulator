//
//  ErrorHandlerTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ErrorHandlerTests: QuickSpec {
    override func spec() {
        describe("ErrorHandler") {
            var sut: DefaultErrorHandler!
            var result: Result<Simulation>!

            beforeEach {
                sut = DefaultErrorHandler()
            }

            context("When handle is called") {
                context("When status is nil") {
                    beforeEach {
                        result = sut.handle(endpoint: nil, status: nil)
                    }

                    it("Should return result failure with unknow error type") {
                        expect(result == Result<Simulation>.failure(GenericError.unknown)).to(beTrue())
                    }
                }

                context("When endpoint is nil") {
                    beforeEach {
                        result = sut.handle(endpoint: nil, status: 404)
                    }

                    it("Should return result failure with GenericError error type") {
                        expect(result == Result<Simulation>.failure(GenericError.networking(404))).to(beTrue())
                    }
                }

                context("When endpoint has an errorMessage") {
                    beforeEach {
                        let simulateEndpoint = SimulateEndpoint(investedAmount: 1000.0,
                                                                rate: 0,
                                                                maturityDate: "2023-10-12")

                        result = sut.handle(endpoint: simulateEndpoint, status: 404)
                    }

                    it("Should return result failure with error from endpoint") {
                        expect(result == Result<Simulation>.failure(GenericError.networking(404))).to(beTrue())
                    }
                }
            }
        }
    }
}
