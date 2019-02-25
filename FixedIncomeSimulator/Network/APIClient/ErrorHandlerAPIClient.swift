//
//  ErrorHandlerAPIClient.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import Foundation

final class ErrorHandlerAPIClient: APIClient {
    private let apiClient: APIClient
    private let errorHandler: ErrorHandler

    init(apiClient: APIClient, errorHandler: ErrorHandler = DefaultErrorHandler()) {
        self.apiClient = apiClient
        self.errorHandler = errorHandler
    }

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        apiClient.request(endpoint) { result in
            switch result {
            case .success:
                completion(result)
            case .failure:
                completion(self.errorHandler.handle(endpoint: endpoint, status: nil))
            }
        }
    }
}
