//
//  DefaultStackView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class DefaultStackView: UIStackView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillProportionally
        self.axis = .horizontal
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
