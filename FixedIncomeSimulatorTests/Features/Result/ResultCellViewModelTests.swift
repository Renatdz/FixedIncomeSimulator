//
//  ResultCellViewModelTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ResultCellViewModelTests: QuickSpec {
    override func spec() {
        describe("ResultCellViewModelTests") {
            var sut: ResultCellViewModel!

            context("when ResultCellViewModel is initialized with values") {
                beforeEach {
                    sut = ResultCellViewModel(description: "Valor aplicado inicialmente", value: "R$ 1.000,00")
                }

                it("should have the right values") {
                    expect(sut.description) == "Valor aplicado inicialmente"
                    expect(sut.value) == "R$ 1.000,00"
                }
            }

            context("when ResultCellViewModel is initialized without values") {
                beforeEach {
                    sut = ResultCellViewModel(description: nil, value: nil)
                }

                it("should have the right values") {
                    expect(sut.description).to(beNil())
                    expect(sut.value).to(beNil())
                }
            }
        }
    }
}
