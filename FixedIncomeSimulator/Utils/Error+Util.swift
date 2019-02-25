//
//  Error+Util.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

protocol PrintableError: Error {
    var localizedDescription: String { get }
}

enum FormError: PrintableError {
    case invalidForm

    var localizedDescription: String {
        switch self {
        case .invalidForm:
            return "Fill the fields correctly."
        }
    }
}

enum GenericError: PrintableError {
    case parse
    case serialize
    case noConnection
    case networking(Int?)
    case unknown

    public var localizedDescription: String {
        switch self {
        case .parse:
            return "Syntax error"

        case .serialize:
            return "Could not serialize the response"

        case .noConnection:
            return "It looks like you don't have connection.\nVerify your internet."

        case .networking:
            return "Connection error"

        case .unknown:
            return "An unexpected error occurred.\nPlease, try again."
        }
    }
}
