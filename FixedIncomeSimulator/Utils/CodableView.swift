//
//  CodableView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

protocol CodableView: class {
    func buildHierarchy()
    func buildConstraints()
    func setup()
    func buildCodableView()
}

extension CodableView {
    func buildCodableView() {
        buildHierarchy()
        buildConstraints()
        setup()
    }

    func setup() { }
}
