//
//  FixedIncomeServiceMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

@testable import FixedIncomeSimulator

final class FixedIncomeServiceMock: FixedIncomeService {
    var result: Result<Simulation>

    var isResultCompletionSuccessCalled = false
    var isResultCompletionFailureCalled = false

    init(result: Result<Simulation>) {
        self.result = result
    }

    func simulate(investedAmount: Double,
                  rate: Int,
                  maturityDate: String,
                  completion: @escaping (Result<Simulation>) -> Void) {
        switch result {
        case .success:
            isResultCompletionSuccessCalled = true
            completion(result)

        case .failure:
            isResultCompletionFailureCalled = true
            completion(.failure(GenericError.unknown))
        }
    }
}
