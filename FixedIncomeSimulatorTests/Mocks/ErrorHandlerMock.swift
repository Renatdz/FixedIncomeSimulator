//
//  ErrorHandlerMock.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Foundation
@testable import FixedIncomeSimulator

final class ErrorHandlerMock: ErrorHandler {
    var isHandleCalled = false
    var statusCode: Int?

    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T> {
        isHandleCalled = true
        statusCode = status
        return Result.failure(GenericError.unknown)
    }
}
