//
//  ResultViewModelTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ResultViewModelTests: QuickSpec {
    override func spec() {
        describe("ResultViewModelTests") {
            var sut: ResultViewModel!
            var simulation: Simulation!
            var resultViewModelDelegateMock: ResultViewModelDelegateMock!

            beforeEach {
                simulation = Simulation.result()
                resultViewModelDelegateMock = ResultViewModelDelegateMock()
                sut = ResultViewModel(simulation: simulation, delegate: resultViewModelDelegateMock)
            }

            context("when ResultViewModel is initialized") {
                it("should have a matrix of values filled") {
                    expect(sut.matrixValues.count) == 13
                }
            }

            context("when showForm is called from delegate") {
                beforeEach {
                    sut.showForm()
                }

                it("should be able to call the FormViewModeldelegate") {
                    expect(resultViewModelDelegateMock.isShowFormCalled) == true
                }
            }
        }
    }
}
