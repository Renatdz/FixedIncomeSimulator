//
//  FormError.swift
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
            return "Preencha os dados corretamente."
        }
    }
}
