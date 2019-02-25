//
//  MaskTextField.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 23/02/19.
//

import UIKit

enum MaskTextFieldStyle {
    case currency
    case date
    case percentage
}

final class MaskTextField: UITextField {
    private let maxCurrencyRange: Int = 11 //million house
    private let maxDateRange: Int = 10
    private let maxPercentageRange: Int = 4
    private let maskStyle: MaskTextFieldStyle

    init(placeholder: String, maskStyle: MaskTextFieldStyle, frame: CGRect = .zero) {
        self.maskStyle = maskStyle

        super.init(frame: frame)

        self.placeholder = placeholder

        delegate = self
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MaskTextField {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 30, weight: .medium)
        keyboardType = .decimalPad
    }
}

extension MaskTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        switch maskStyle {
        case .currency:
            return currency(textField,
                            shouldChangeCharactersIn: range,
                            replacementString: string)

        case .date:
            return date(textField,
                        shouldChangeCharactersIn: range,
                        replacementString: string)

        case .percentage:
            return percentage(textField,
                              shouldChangeCharactersIn: range,
                              replacementString: string)
        }
    }
}

// MARK: - Currency
private extension MaskTextField {
    func currency(_ textField: UITextField,
                  shouldChangeCharactersIn range: NSRange,
                  replacementString string: String) -> Bool {
        let text: String = (textField.text ?? "")

        if text.count >= maxCurrencyRange && string != "" {
            return false
        }

        let finalString = (text as NSString).replacingCharacters(in: range, with: string)

        if finalString == "R$ " {
            textField.text = ""
            return false
        }

        textField.text = finalString.currency
        return false
    }
}

// MARK: - Date
private extension MaskTextField {
    func date(_ textField: UITextField,
              shouldChangeCharactersIn range: NSRange,
              replacementString string: String) -> Bool {
        var text: String = (textField.text ?? "")

        if text.count >= maxDateRange && string != "" || !string.isAlphanumeric && string != "" {
            return false
        }

        if string == "" && text.last == "/" {
            text.removeLast()
            text.removeLast()
            textField.text = text
            return false
        }

        var finalString = (text as NSString).replacingCharacters(in: range, with: string)

        if text.count == 1 || text.count == 4 {
            if !(string == "") {
                finalString += "/"
            }
        }

        textField.text = finalString
        return false
    }
}

// MARK: - Percentage
private extension MaskTextField {
    func percentage(_ textField: UITextField,
                    shouldChangeCharactersIn range: NSRange,
                    replacementString string: String) -> Bool {
        var text: String = (textField.text ?? "")

        if text.count >=
            maxPercentageRange && string != "" || !string.isAlphanumeric && string != "" {
            return false
        }

        if string == "" && text.last == "%" {
            text.removeLast()
            text.removeLast()
            textField.text = text
            return false
        }

        var finalString = (text as NSString).replacingCharacters(in: range, with: string)

        if text.count == 1 || text.count == 2 {
            if !(string == "") {
                finalString += "%"
            }
        }

        if text.count == 3 && text.contains("%") {
            if !(string == "") {
                finalString = finalString.replacingOccurrences(of: "%", with: "")
                finalString += "%"
            }
        }

        textField.text = finalString
        return false
    }
}
