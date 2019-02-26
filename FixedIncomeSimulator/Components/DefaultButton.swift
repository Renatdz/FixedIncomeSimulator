//
//  DefaultButton.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class DefaultButton: UIButton {
    var title: String

    private(set) var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .white
        return indicator
    }()

    init(title: String = "",
         titleColor: UIColor = .white,
         textAlignment: NSTextAlignment = .center,
         backgroundColor: UIColor = #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1),
         cornerRadius: CGFloat = 20,
         frame: CGRect = .zero) {
        self.title = title
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.isEnabled = true
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension DefaultButton {
    func loadingIndicator(_ show: Bool) {
        guard show else {
            isEnabled = true
            setTitle(title, for: .normal)
            indicator.stopAnimating()
            indicator.removeFromSuperview()
            return
        }

        isEnabled = false
        setTitle(nil, for: .normal)
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        addSubview(indicator)
        indicator.startAnimating()
    }
}
