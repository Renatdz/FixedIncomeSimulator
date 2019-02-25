//
//  DefaultButton.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class DefaultButton: UIButton {
    init(title: String = "",
         titleColor: UIColor = .white,
         textAlignment: NSTextAlignment = .center,
         backgroundColor: UIColor = #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1),
         cornerRadius: CGFloat = 20,
         frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.isEnabled = true
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
