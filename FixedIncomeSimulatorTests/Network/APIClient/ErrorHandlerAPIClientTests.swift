//
//  ErrorHandlerAPIClientTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

// swiftlint:disable function_body_length

import Quick
import Nimble

@testable import FixedIncomeSimulator

class ErrorHandlerAPIClientTests: QuickSpec {
    var sut: ErrorHandlerAPIClient!
    var apiClient: APIClientMock!
    var errorHandler: ErrorHandlerMock!
    var simulateEndpoint: SimulateEndpoint!

    override func spec() {
        describe("ErrorHandlerAPIClientTests") {
            beforeEach {
                self.apiClient = APIClientMock()
                self.errorHandler = ErrorHandlerMock()
                self.sut = ErrorHandlerAPIClient(apiClient: self.apiClient, errorHandler: self.errorHandler)

                self.simulateEndpoint = SimulateEndpoint(investedAmount: 1000.0, rate: 123, maturityDate: "2023-10-12")
            }

            context("When request is called") {
                context("When success") {
                    var isCompletionCalled = false

                    beforeEach {
                        guard let data = try? JSONEncoder().encode(Simulation.result()) else { return }
                        self.apiClient.result = Result.success(data)

                        self.sut.request(self.simulateEndpoint, completion: { _ in
                            isCompletionCalled = true
                        })
                    }

                    afterEach {
                        isCompletionCalled = false
                    }

                    it("Should call request from apiClient") {
                        expect(self.apiClient.isRequestCalled).to(beTrue())
                    }

                    it("Should call completion") {
                        expect(isCompletionCalled).to(beTrue())
                    }
                }

                context("When failure") {
                    context("When error is FLError of networking type") {
                        var isCompletionCalled = false

                        beforeEach {
                            self.apiClient.result = Result.failure(GenericError.networking(404))

                            self.sut.request(self.simulateEndpoint, completion: { _ in
                                isCompletionCalled = true
                            })
                        }

                        it("Should call request from apiClient") {
                            expect(self.apiClient.isRequestCalled).to(beTrue())
                        }

                        it("Should call completion") {
                            expect(isCompletionCalled).to(beTrue())
                        }

                        it("Should call handle from errorHandler with properly statusCode") {
                            expect(self.errorHandler.isHandleCalled).to(beTrue())
                            expect(self.errorHandler.statusCode).to(beNil())
                        }
                    }

                    context("When error is not of networking type") {
                        var isCompletionCalled = false

                        beforeEach {
                            self.apiClient.result = Result.failure(GenericError.unknown)

                            self.sut.request(self.simulateEndpoint, completion: { _ in
                                isCompletionCalled = true
                            })
                        }

                        it("Should call request from apiClient") {
                            expect(self.apiClient.isRequestCalled).to(beTrue())
                        }

                        it("Should call completion") {
                            expect(isCompletionCalled).to(beTrue())
                        }

                        it("Should call handle from errorHandler with statusCode nil") {
                            expect(self.errorHandler.isHandleCalled).to(beTrue())
                            expect(self.errorHandler.statusCode).to(beNil())
                        }
                    }
                }
            }
        }
    }
}
