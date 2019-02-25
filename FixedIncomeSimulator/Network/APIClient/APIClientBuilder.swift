//
//  APIClientBuilder.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import Foundation

enum Result<T>: Equatable {
    case success(T)
    case failure(PrintableError)

    public static func == (lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case (.failure, .failure), (.success, .success):
            return true
        default:
            return false
        }
    }
}

protocol APIClient {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void)
}

final class APIClientBuilder {
    private var apiClient: APIClient

    init(baseURL: String, urlSession: URLSession = URLSession.shared) {
        apiClient = RequestAPIClient(baseURL: baseURL, urlSession: urlSession)
    }

    func withErrorHandler(errorHandler: ErrorHandler = DefaultErrorHandler()) -> APIClientBuilder {
        apiClient = ErrorHandlerAPIClient(apiClient: apiClient, errorHandler: errorHandler)
        return self
    }

    func build() -> APIClient {
        return apiClient
    }
}
