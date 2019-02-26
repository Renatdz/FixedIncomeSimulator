//
//  ResultViewModelDelegateMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

@testable import FixedIncomeSimulator

final class ResultViewModelDelegateMock: ResultViewModelDelegate {
    var isShowFormCalled: Bool = false

    func showForm() {
        isShowFormCalled = true
    }
}
