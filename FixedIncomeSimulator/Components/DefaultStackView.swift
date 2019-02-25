//
//  DefaultStackView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class DefaultStackView: UIStackView {
    init(distribution: Distribution = .fillProportionally,
         axis: NSLayoutConstraint.Axis = .horizontal,
         spacing: CGFloat = 0,
         frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
