//
//  FormViewDelegateMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

@testable import FixedIncomeSimulator

final class FormViewDelegateMock: FormViewDelegate {
    var isSimulateWasPressedCalled: Bool = false

    func simulateWasPressed(investedValue: String, investimentDueDate: String, cdiPercentage: String) {
        isSimulateWasPressedCalled = true
    }
}
