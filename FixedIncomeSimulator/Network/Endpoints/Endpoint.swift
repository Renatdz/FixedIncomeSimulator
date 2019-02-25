//
//  Endpoint.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

enum MethodHTTP: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ParameterEncoding {
    case json
    case url
}

protocol Endpoint {
    var method: MethodHTTP { get set }
    var path: String { get set }
    var parameters: [String: Any]? { get set }
    var headers: [String: String]? { get set }
    var parameterEncoding: ParameterEncoding { get set }

    func errorMessage(with statusCode: Int) -> PrintableError?
}

extension Endpoint {
    func errorMessage(with statusCode: Int) -> PrintableError? {
        return nil
    }
}
