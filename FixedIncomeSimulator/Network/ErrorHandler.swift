//
//  ErrorHandler.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

protocol ErrorHandler {
    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T>
}

final class DefaultErrorHandler: ErrorHandler {
    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T> {
        guard let status = status else {
            return Result.failure(GenericError.unknown)
        }

        guard let error = endpoint?.errorMessage(with: status) else {
            return Result.failure(GenericError.networking(status))
        }

        return Result.failure(error)
    }
}
