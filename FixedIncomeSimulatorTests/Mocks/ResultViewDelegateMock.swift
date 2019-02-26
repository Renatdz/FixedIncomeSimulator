//
//  ResultViewDelegateMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

@testable import FixedIncomeSimulator

final class ResultViewDelegateMock: ResultViewDelegate {
    var isSimulateAgainWasPressedCalled: Bool = false

    func simulateAgainWasPressed() {
        isSimulateAgainWasPressedCalled = true
    }
}
