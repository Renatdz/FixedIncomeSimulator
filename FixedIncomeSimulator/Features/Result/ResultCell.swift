//
//  ResultCell.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import UIKit
import Reusable

final class ResultCell: UITableViewCell {
    private let stackView: DefaultStackView = DefaultStackView()
    private let descriptionLB: DescriptionLabel = DescriptionLabel(textAlignment: .left)
    private let valueLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)
}

// MARK: - Binding
extension ResultCell {
    func setup(with viewModel: ResultCellViewModel) {
        descriptionLB.text = viewModel.description
        valueLB.text = viewModel.value
        buildCodableView()
    }
}

// MARK: - Reusable
extension ResultCell: Reusable { }

// MARK: - CodableView
extension ResultCell: CodableView {
    func buildHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(descriptionLB)
        stackView.addArrangedSubview(valueLB)
    }

    func buildConstraints() {
        stackView.insetConstraints(inSuperview: contentView)
        descriptionLB.heightConstraint(constant: 20)
        valueLB.heightConstraint(constant: 20)
    }

    func setup() {
        selectionStyle = .none
        backgroundColor = .white
    }
}
