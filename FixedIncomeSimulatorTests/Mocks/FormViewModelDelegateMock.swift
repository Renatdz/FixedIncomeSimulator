//
//  FormViewModelDelegateMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

@testable import FixedIncomeSimulator

final class FormViewModelDelegateMock: FormViewModelDelegate {
    var isShowResultCalled: Bool = false

    func showResult(with simulation: Simulation) {
        isShowResultCalled = true
    }
}
