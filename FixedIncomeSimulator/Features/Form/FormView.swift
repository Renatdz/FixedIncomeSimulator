//
//  FormView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World!"
        label.textColor = .gray
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildCodableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodableView
extension FormView: CodableView {
    func buildHierarchy() {
        addSubview(label)
    }

    func buildConstraints() {
        label.centerXConstraint(parentView: self)
        label.centerYConstraint(parentView: self)
    }

    func setup() {
        backgroundColor = .white
    }
}
