//
//  FormView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormView: UIView {
    private lazy var keyboardToolBar: UIToolbar = {
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let midSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let rightButton = UIBarButtonItem(barButtonSystemItem: .done,
                                          target: self,
                                          action: #selector(doneButtonWasPressed))
        let toolbar = UIToolbar(frame: .zero)
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        toolbar.items = [leftSpace, midSpace, rightButton]
        return toolbar
    }()

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var investedValueDescriptionLB: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quanto você gostaria de aplicar?*"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private lazy var investedValueTF: MaskTextField = {
        let textField = MaskTextField(placeholder: "R$", maskStyle: .currency)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        textField.keyboardType = .decimalPad
        textField.inputAccessoryView = keyboardToolBar
        return textField
    }()

    private lazy var topSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var investimentDueDateDescriptionLB: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual a data de vencimento do investimento?*"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private lazy var investimentDueDateTF: MaskTextField = {
        let textField = MaskTextField(placeholder: "dia/mês/ano", maskStyle: .date)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        textField.keyboardType = .decimalPad
        textField.inputAccessoryView = keyboardToolBar
        return textField
    }()

    private lazy var midSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var cdiPercentageDescriptionLB: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual o percentual do CDI do investimento?*"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()

    private lazy var cdiPercentageTF: MaskTextField = {
        let textField = MaskTextField(placeholder: "100%", maskStyle: .percentage)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        textField.keyboardType = .decimalPad
        textField.inputAccessoryView = keyboardToolBar
        return textField
    }()

    private lazy var bottomSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var simulateBT: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Simular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1)
        button.layer.cornerRadius = 20
        button.isEnabled = true
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildCodableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

// MARK: - Keyboard Toolbar Action
extension FormView {
    @objc
    private func doneButtonWasPressed() {
        investedValueTF.resignFirstResponder()
        investimentDueDateTF.resignFirstResponder()
        cdiPercentageTF.resignFirstResponder()
    }
}

// MARK: - CodableView
extension FormView: CodableView {
    func buildHierarchy() {
        addSubview(contentView)
        contentView.addSubview(investedValueDescriptionLB)
        contentView.addSubview(investedValueTF)
        contentView.addSubview(topSeparator)
        contentView.addSubview(investimentDueDateDescriptionLB)
        contentView.addSubview(investimentDueDateTF)
        contentView.addSubview(midSeparator)
        contentView.addSubview(cdiPercentageDescriptionLB)
        contentView.addSubview(cdiPercentageTF)
        contentView.addSubview(bottomSeparator)
        contentView.addSubview(simulateBT)
    }

    func buildConstraints() {
        setupContentViewConstraints()
        setupInvestedValueDescriptionLBConstraints()
        setupInvestedValueTFConstraints()
        setupTopSeparatorConstraints()
        setupInvestimentDueDateDescriptionLBConstraints()
        setupInvestimentDueDateTFConstraints()
        setupMidSeparatorConstraints()
        setupCdiPercentageDescriptionLBConstraints()
        setupCdiPercentageTFConstraints()
        setupBottomSeparatorConstraints()
        setupSimulateBTConstraints()
    }

    private func setupContentViewConstraints() {
        contentView.centerYConstraint(parentView: self)
        contentView.leftConstraint(parentView: self, constant: 20)
        contentView.rightConstraint(parentView: self, constant: 20)
    }

    private func setupInvestedValueDescriptionLBConstraints() {
        investedValueDescriptionLB.topConstraint(parentView: contentView)
        investedValueDescriptionLB.leftConstraint(parentView: contentView)
        investedValueDescriptionLB.rightConstraint(parentView: contentView)
    }

    private func setupInvestedValueTFConstraints() {
        investedValueTF.overConstraint(topItem: investedValueDescriptionLB, constant: 10)
        investedValueTF.leftConstraint(parentView: contentView)
        investedValueTF.rightConstraint(parentView: contentView)
        investedValueTF.heightConstraint(constant: 50)
    }

    private func setupTopSeparatorConstraints() {
        topSeparator.overConstraint(topItem: investedValueTF)
        topSeparator.leftConstraint(parentView: contentView)
        topSeparator.rightConstraint(parentView: contentView)
        topSeparator.heightConstraint(constant: 0.5)
    }

    private func setupInvestimentDueDateDescriptionLBConstraints() {
        investimentDueDateDescriptionLB.overConstraint(topItem: topSeparator,
                                                       constant: 50)
        investimentDueDateDescriptionLB.leftConstraint(parentView: contentView)
        investimentDueDateDescriptionLB.rightConstraint(parentView: contentView)
    }

    private func setupInvestimentDueDateTFConstraints() {
        investimentDueDateTF.overConstraint(topItem: investimentDueDateDescriptionLB,
                                            constant: 10)
        investimentDueDateTF.leftConstraint(parentView: contentView)
        investimentDueDateTF.rightConstraint(parentView: contentView)
        investimentDueDateTF.heightConstraint(constant: 50)
    }

    private func setupMidSeparatorConstraints() {
        midSeparator.overConstraint(topItem: investimentDueDateTF)
        midSeparator.leftConstraint(parentView: contentView)
        midSeparator.rightConstraint(parentView: contentView)
        midSeparator.heightConstraint(constant: 0.5)
    }

    private func setupCdiPercentageDescriptionLBConstraints() {
        cdiPercentageDescriptionLB.overConstraint(topItem: midSeparator, constant: 50)
        cdiPercentageDescriptionLB.leftConstraint(parentView: contentView)
        cdiPercentageDescriptionLB.rightConstraint(parentView: contentView)
    }

    private func setupCdiPercentageTFConstraints() {
        cdiPercentageTF.overConstraint(topItem: cdiPercentageDescriptionLB, constant: 10)
        cdiPercentageTF.leftConstraint(parentView: contentView)
        cdiPercentageTF.rightConstraint(parentView: contentView)
        cdiPercentageTF.heightConstraint(constant: 50)
    }

    private func setupBottomSeparatorConstraints() {
        bottomSeparator.overConstraint(topItem: cdiPercentageTF)
        bottomSeparator.leftConstraint(parentView: contentView)
        bottomSeparator.rightConstraint(parentView: contentView)
        bottomSeparator.heightConstraint(constant: 0.5)
    }

    private func setupSimulateBTConstraints() {
        simulateBT.overConstraint(topItem: bottomSeparator, constant: 50)
        simulateBT.leftConstraint(parentView: contentView)
        simulateBT.rightConstraint(parentView: contentView)
        simulateBT.bottomConstraint(parentView: contentView)
        simulateBT.heightConstraint(constant: 50)
    }

    func setup() {
        backgroundColor = .white
    }
}
