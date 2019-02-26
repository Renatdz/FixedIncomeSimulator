//
//  ResultViewControllerTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ResultViewControllerTests: QuickSpec {
    override func spec() {
        describe("ResultViewControllerTests") {
            var sut: ResultViewController!
            var resultViewModelDelegateMock: ResultViewModelDelegateMock!

            context("when you tried to instantiate ResultViewController with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = ResultViewController(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when simulateAgainWasPressed is called from delegate") {
                beforeEach {
                    resultViewModelDelegateMock = ResultViewModelDelegateMock()
                    let viewModel = ResultViewModel(simulation: Simulation.result(),
                                                    delegate: resultViewModelDelegateMock)
                    sut = ResultViewController(viewModel: viewModel)
                    _ = sut.view
                    sut.simulateAgainWasPressed()
                }

                it("should be able to call the FormViewModeldelegate") {
                    expect(resultViewModelDelegateMock.isShowFormCalled) == true
                }
            }
        }
    }
}
