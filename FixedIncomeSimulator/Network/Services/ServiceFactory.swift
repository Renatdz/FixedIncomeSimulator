//
//  ServiceFactory.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

protocol ServiceFactory {
    func getFixedIncomeService() -> FixedIncomeService
}

public final class APIServiceFactory: ServiceFactory {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getFixedIncomeService() -> FixedIncomeService {
        return DefaultFixedIncomeService(apiClient: apiClient)
    }
}
