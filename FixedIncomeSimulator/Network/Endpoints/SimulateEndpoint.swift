//
//  SimulateEndpoint.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

final class SimulateEndpoint: Endpoint {
    var method: MethodHTTP = {
        .get
    }()

    var path: String

    var parameters: [String: Any]?

    var headers: [String: String]?

    var parameterEncoding: ParameterEncoding = {
        .url
    }()

    init(investedAmount: Double, rate: Int, maturityDate: String) {
        path = "/calculator/simulate?"
        + "investedAmount=\(investedAmount)&index=CDI&rate=\(rate)&isTaxFree=false&maturityDate=\(maturityDate)"
    }
}
