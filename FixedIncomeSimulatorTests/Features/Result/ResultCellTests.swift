//
//  ResultCellTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class ResultCellTests: QuickSpec {
    override func spec() {
        describe("ResultCellTests") {
            var sut: ResultCell!

            context("when load into screen") {
                beforeEach {
                    sut = ResultCell()
                    sut.frame = CGRect(x: 0, y: 0, width: 374, height: 20)
                    let viewModel = ResultCellViewModel(description: "Valor aplicado inicialmente",
                                                        value: "R$ 1.000,00")
                    sut.setup(with: viewModel)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
