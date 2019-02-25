//
//  ServiceFactoryTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ServiceFactoryTests: QuickSpec {
    override func spec() {
        describe("ServiceFactoryTests") {
            var sut: ServiceFactory!

            beforeEach {
                let apiClient = APIClientBuilder(baseURL: "http://localhost")
                    .withErrorHandler()
                    .build()
                sut = APIServiceFactory(apiClient: apiClient)
            }

            context("When getFixedIncomeService is called") {
                it("Should return a FixedIncomeService") {
                    expect(sut.getFixedIncomeService()).to(beAKindOf(FixedIncomeService.self))
                }
            }
        }
    }
}
