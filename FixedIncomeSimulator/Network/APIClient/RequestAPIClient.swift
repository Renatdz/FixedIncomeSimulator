//
//  RequestAPIClient.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import Foundation

final class RequestAPIClient: APIClient {
    private let baseURL: String
    private let urlSession: URLSession
    private var endpoint: Endpoint?

    init(baseURL: String, urlSession: URLSession) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        guard let fullPath = URL(string: baseURL + endpoint.path) else {
            return completion(.failure(GenericError.unknown))
        }

        self.endpoint = endpoint

        request(fullPath, method: endpoint.method, completion: completion)
    }

    private func request(_ fullPath: URL,
                         method: MethodHTTP,
//                         parameters: Parameters?,
//                         encoding: Alamofire.ParameterEncoding,
//                         headers: HTTPHeaders?,
                         completion: @escaping (Result<Data>) -> Void) {
        var request = URLRequest(url: fullPath)
        request.httpMethod = method.rawValue

        let dataTask = urlSession.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(GenericError.noConnection)); return
            }

            completion(.success(data))
        }

        dataTask.resume()
    }
}
