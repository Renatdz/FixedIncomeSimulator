//
//  ResultViewTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class ResultViewTests: QuickSpec {
    override func spec() {
        describe("ResultViewTests") {
            var sut: ResultView!

            context("when you tried to instantiate ResultView with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = ResultView(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {
                beforeEach {
                    let resultViewModel = ResultViewModel(simulation: Simulation.result(), delegate: nil)
                    sut = ResultView()
                    sut.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
                    sut.binding(with: resultViewModel)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when formView call the ResultViewDelegate") {
                var resultViewDelegateMock: ResultViewDelegateMock!

                beforeEach {
                    resultViewDelegateMock = ResultViewDelegateMock()
                    sut = ResultView()
                    sut.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
                    sut.delegate = resultViewDelegateMock
                    sut.simulateAgainBT.sendActions(for: .touchUpInside)
                }

                it("resultViewDelegate should be called") {
                    expect(resultViewDelegateMock.isSimulateAgainWasPressedCalled) == true
                }
            }
        }
    }
}
