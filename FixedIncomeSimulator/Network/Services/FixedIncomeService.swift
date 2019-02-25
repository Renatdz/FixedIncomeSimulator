//
//  FixedIncomeService.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import Foundation

protocol FixedIncomeService {
    func simulate(investedAmount: Double,
                  rate: Int,
                  maturityDate: String,
                  completion: @escaping (Result<Simulation>) -> Void)
}

public final class DefaultFixedIncomeService: FixedIncomeService {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func simulate(investedAmount: Double,
                  rate: Int,
                  maturityDate: String,
                  completion: @escaping (Result<Simulation>) -> Void) {
        let endpoint = SimulateEndpoint(investedAmount: investedAmount, rate: rate, maturityDate: maturityDate)

        apiClient.request(endpoint) { result in
            switch result {
            case let .success(data):
                if let simulation = try? JSONDecoder().decode(Simulation.self, from: data) {
                    completion(.success(simulation))
                } else {
                    completion(.failure(GenericError.parse))
                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
