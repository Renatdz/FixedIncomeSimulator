//
//  ErrorView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

class ErrorView: UIView {
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8, green: 0.0, blue: 0.0, alpha: 1)
        return view
    }()

    private lazy var messageLB: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.alpha = 0
        return label
    }()

    init(message: String, frame: CGRect = .zero) {
        super.init(frame: frame)
        buildCodableView()
        setup(with: message)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Show error with animation
extension ErrorView {
    func show(in controller: UIViewController) {
        frame = CGRect(x: 0, y: -80, width: controller.view.frame.width, height: 80)
        controller.view.addSubview(self)

        showError(in: controller)
    }

    private func showError(in controller: UIViewController) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.frame = CGRect(x: 0, y: 0, width: controller.view.frame.width, height: 80)
            self.messageLB.alpha = 1
        }, completion: { _ in
            self.hideError()
        })
    }

    private func hideError() {
        UIView.transition(with: self, duration: 0.8, options: .transitionCrossDissolve, animations: {
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}

// MARK: - Setup style
private extension ErrorView {
    func setup(with message: String) {
        messageLB.text = message
    }
}

// MARK: - CodableView
extension ErrorView: CodableView {
    func buildHierarchy() {
        addSubview(contentView)
        contentView.addSubview(messageLB)
    }

    func buildConstraints() {
        contentView.insetConstraints(inSuperview: self)

        messageLB.centerXConstraint(parentView: contentView)
        messageLB.centerYConstraint(parentView: contentView)
    }
}
