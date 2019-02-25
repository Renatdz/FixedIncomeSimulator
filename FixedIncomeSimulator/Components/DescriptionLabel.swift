//
//  DescriptionLabel.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class DescriptionLabel: UILabel {
    init(text: String = "",
         textColor: UIColor = .gray,
         textAlignment: NSTextAlignment = .center,
         font: UIFont = .systemFont(ofSize: 13, weight: .regular),
         frame: CGRect = .zero) {
        super.init(frame: frame)
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
