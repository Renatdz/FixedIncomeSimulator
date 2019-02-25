//
//  ResultCellViewModel.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

final class ResultCellViewModel {
    private(set) var description: String?
    private(set) var value: String?

    init(description: String?, value: String?) {
        self.description = description
        self.value = value
    }
}
