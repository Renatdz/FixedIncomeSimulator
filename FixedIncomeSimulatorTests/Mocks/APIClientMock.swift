//
//  APIClientMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

// swiftlint:disable force_try

import Foundation
@testable import FixedIncomeSimulator

final class APIClientMock: APIClient {
    var isRequestCalled = false
    var result: Result<Data>?
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        isRequestCalled = true
        guard let result = result else { return }
        completion(result)
    }

    func cancelRequest() { }
}

final class APIClientFixedIncomeMock: APIClient {
    var isRequestCalled = false
    var endpoints: [Endpoint] = []
    var callsCount = 1
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        var result: Result<Data>?

        if callsCount == 1 {
            let data = try! JSONEncoder().encode(Simulation.result())
            result = Result.success(data)
        }

        callsCount += 1
        self.endpoints.append(endpoint)
        isRequestCalled = true
        guard let response = result else { return }
        completion(response)
    }
}
