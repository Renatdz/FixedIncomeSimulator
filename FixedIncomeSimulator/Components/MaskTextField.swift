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

class MaskTextField: UITextField {
    private let maxCurrencyRange: Int = 11 //million house
    private let maxDateRange: Int = 10
    private let maxPercentageRange: Int = 3
    private let maskStyle: MaskTextFieldStyle

    init(placeholder: String, maskStyle: MaskTextFieldStyle, frame: CGRect = .zero) {
        self.maskStyle = maskStyle

        super.init(frame: frame)

        self.placeholder = placeholder
        self.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let text: NSString = (textField.text ?? "") as NSString

        if text.length >= maxCurrencyRange && string != "" {
            return false
        }

        let finalString = text.replacingCharacters(in: range, with: string)

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

        if textField.text?.count == 1 || textField.text?.count == 4 {
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

        if textField.text?.count == 1 {
            if !(string == "") {
                finalString += "%"
            }
        }

        textField.text = finalString
        return false
    }
}