//
//  ResultView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class ResultView: UIView {
    // MARK: - UI Components
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()

    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let simulationResultDescriptionLB: DescriptionLabel = DescriptionLabel(text: "Resultado da simulação")
    private let simulationGrossAmountLB: DescriptionLabel = DescriptionLabel(
        textColor: .black, font: .systemFont(ofSize: 40, weight: .regular)
    )
    private let simulationGrossAmountProfitSV: DefaultStackView = {
        let stackView = DefaultStackView()
        stackView.alignment = .center
        return stackView
    }()
    private let simulationGrossAmountProfitDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Rendimento total de ", textAlignment: .left
    )
    private let simulationGrossAmountProfitLB: DescriptionLabel = DescriptionLabel(
        textColor: #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1), textAlignment: .left
    )

    private lazy var mainBodyView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let investedAmountSV: DefaultStackView = DefaultStackView()
    private let investedAmountDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Valor aplicado inicialmente", textAlignment: .left
    )
    private let investedAmountLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let grossAmountSV: DefaultStackView = DefaultStackView()
    private let grossAmountDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Valor bruto do investimento", textAlignment: .left
    )
    private let grossAmountLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let grossAmountProfitSV: DefaultStackView = DefaultStackView()
    private let grossAmountProfitDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Valor do rendimento", textAlignment: .left
    )
    private let grossAmountProfitLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let taxesAmountSV: DefaultStackView = DefaultStackView()
    private let taxesAmountDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "IR sobre o investimento", textAlignment: .left
    )
    private let taxesAmountLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let netAmountSV: DefaultStackView = DefaultStackView()
    private let netAmountDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Valor líquido do investimento", textAlignment: .left
    )
    private let netAmountLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private lazy var secondaryBodyView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let maturityDateSV: DefaultStackView = DefaultStackView()
    private let maturityDateDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Data de resgate", textAlignment: .left
    )
    private let maturityDateLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let maturityTotalDaysSV: DefaultStackView = DefaultStackView()
    private let maturityTotalDaysDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Dias corridos", textAlignment: .left
    )
    private let maturityTotalDaysLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let monthlyGrossRateProfitSV: DefaultStackView = DefaultStackView()
    private let monthlyGrossRateProfitDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Rendimento mensal", textAlignment: .left
    )
    private let monthlyGrossRateProfitLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let cdiPercentageSV: DefaultStackView = DefaultStackView()
    private let cdiPercentageDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Percentual do CDI do investimento", textAlignment: .left
    )
    private let cdiPercentageLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let yearlyInterestRateSV: DefaultStackView = DefaultStackView()
    private let yearlyInterestRateDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Rentabilidade anual", textAlignment: .left
    )
    private let yearlyInterestRateLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private let periodRateProfitSV: DefaultStackView = DefaultStackView()
    private let periodRateProfitDescriptionLB: DescriptionLabel = DescriptionLabel(
        text: "Rentabilidade no período", textAlignment: .left
    )
    private let periodRateProfitLB: DescriptionLabel = DescriptionLabel(textColor: .black, textAlignment: .right)

    private lazy var simulateAgainBT: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Simular novamente", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1)
        button.layer.cornerRadius = 20
        button.isEnabled = true
        return button
    }()

    // MARK: - Inits
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildCodableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Binding
extension ResultView {
    func binding(with viewModel: ResultViewModel) {
        simulationGrossAmountLB.text = viewModel.grossAmount
        simulationGrossAmountProfitLB.text = viewModel.grossAmountProfit

        investedAmountLB.text = viewModel.investedAmount
        grossAmountLB.text = viewModel.grossAmount
        grossAmountProfitLB.text = viewModel.grossAmountProfit
        taxesAmountLB.text = viewModel.taxesAmountWithPercentage
        netAmountLB.text = viewModel.netAmount

        maturityDateLB.text = viewModel.maturityDate
        maturityTotalDaysLB.text = viewModel.maturityTotalDays
        monthlyGrossRateProfitLB.text = viewModel.monthlyGrossRateProfit
        cdiPercentageLB.text = viewModel.cdiPercentage
        yearlyInterestRateLB.text = viewModel.yearlyInterestRate
        periodRateProfitLB.text = viewModel.periodRateProfit
    }
}

// MARK: - CodableView
extension ResultView: CodableView {
    func buildHierarchy() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(mainBodyView)
        contentStackView.addArrangedSubview(secondaryBodyView)
        contentStackView.addArrangedSubview(simulateAgainBT)

        headerView.addSubview(simulationResultDescriptionLB)
        headerView.addSubview(simulationGrossAmountLB)
        headerView.addSubview(simulationGrossAmountProfitSV)

        simulationGrossAmountProfitSV.addArrangedSubview(simulationGrossAmountProfitDescriptionLB)
        simulationGrossAmountProfitSV.addArrangedSubview(simulationGrossAmountProfitLB)

        setupMainBodyViewSubviews()
        setupSecondaryBodyViewSubviews()
    }

    private func setupMainBodyViewSubviews() {
        mainBodyView.addSubview(investedAmountSV)
        mainBodyView.addSubview(grossAmountSV)
        mainBodyView.addSubview(grossAmountProfitSV)
        mainBodyView.addSubview(taxesAmountSV)
        mainBodyView.addSubview(netAmountSV)

        investedAmountSV.addArrangedSubview(investedAmountDescriptionLB)
        investedAmountSV.addArrangedSubview(investedAmountLB)

        grossAmountSV.addArrangedSubview(grossAmountDescriptionLB)
        grossAmountSV.addArrangedSubview(grossAmountLB)

        grossAmountProfitSV.addArrangedSubview(grossAmountProfitDescriptionLB)
        grossAmountProfitSV.addArrangedSubview(grossAmountProfitLB)

        taxesAmountSV.addArrangedSubview(taxesAmountDescriptionLB)
        taxesAmountSV.addArrangedSubview(taxesAmountLB)

        netAmountSV.addArrangedSubview(netAmountDescriptionLB)
        netAmountSV.addArrangedSubview(netAmountLB)
    }

    private func setupSecondaryBodyViewSubviews() {
        secondaryBodyView.addSubview(maturityDateSV)
        secondaryBodyView.addSubview(maturityTotalDaysSV)
        secondaryBodyView.addSubview(monthlyGrossRateProfitSV)
        secondaryBodyView.addSubview(cdiPercentageSV)
        secondaryBodyView.addSubview(yearlyInterestRateSV)
        secondaryBodyView.addSubview(periodRateProfitSV)

        maturityDateSV.addArrangedSubview(maturityDateDescriptionLB)
        maturityDateSV.addArrangedSubview(maturityDateLB)

        maturityTotalDaysSV.addArrangedSubview(maturityTotalDaysDescriptionLB)
        maturityTotalDaysSV.addArrangedSubview(maturityTotalDaysLB)

        monthlyGrossRateProfitSV.addArrangedSubview(monthlyGrossRateProfitDescriptionLB)
        monthlyGrossRateProfitSV.addArrangedSubview(monthlyGrossRateProfitLB)

        cdiPercentageSV.addArrangedSubview(cdiPercentageDescriptionLB)
        cdiPercentageSV.addArrangedSubview(cdiPercentageLB)

        yearlyInterestRateSV.addArrangedSubview(yearlyInterestRateDescriptionLB)
        yearlyInterestRateSV.addArrangedSubview(yearlyInterestRateLB)

        yearlyInterestRateSV.addArrangedSubview(yearlyInterestRateDescriptionLB)
        yearlyInterestRateSV.addArrangedSubview(yearlyInterestRateLB)

        periodRateProfitSV.addArrangedSubview(periodRateProfitDescriptionLB)
        periodRateProfitSV.addArrangedSubview(periodRateProfitLB)
    }

    func buildConstraints() {
        setupContentStackViewConstraints()

        setupSimulationResultDescriptionLBConstraints()
        setupSimulationGrossAmountLBConstraints()
        setupSimulationGrossAmountProfitConstraints()

        setupInvestedAmountConstraints()
        setupGrossAmountConstraints()
        setupGrossAmountProfitConstraints()
        setupTaxesAmountConstraints()
        setupNetAmountConstraints()

        setupMaturityDateConstraints()
        setupMaturityTotalDaysConstraints()
        setupMonthlyGrossRateProfitConstraints()
        setupCdiPercentageConstraints()
        setupYearlyInterestRateConstraints()
        setupPeriodRateProfitConstraints()

        setupSimulateAgainBTConstraints()
    }

    private func setupContentStackViewConstraints() {
        contentStackView.safeAreaTop(safeAreaView: self, constant: -20, statusBar: true)
        contentStackView.leftConstraint(parentView: self, constant: 20)
        contentStackView.rightConstraint(parentView: self, constant: 20)
        contentStackView.safeAreaBottom(safeAreaView: self, constant: 20)
    }

    private func setupSimulationResultDescriptionLBConstraints() {
        simulationResultDescriptionLB.topConstraint(parentView: headerView)
        simulationResultDescriptionLB.leftConstraint(parentView: headerView)
        simulationResultDescriptionLB.rightConstraint(parentView: headerView)
        simulationResultDescriptionLB.heightConstraint(constant: 20)
    }

    private func setupSimulationGrossAmountLBConstraints() {
        simulationGrossAmountLB.overConstraint(topItem: simulationResultDescriptionLB, constant: 10)
        simulationGrossAmountLB.leftConstraint(parentView: headerView)
        simulationGrossAmountLB.rightConstraint(parentView: headerView)
    }

    private func setupSimulationGrossAmountProfitConstraints() {
        simulationGrossAmountProfitSV.overConstraint(topItem: simulationGrossAmountLB, constant: 10)
//        simulationGrossAmountProfitSV.leftConstraint(parentView: headerView)
//        simulationGrossAmountProfitSV.rightConstraint(parentView: headerView)
        simulationGrossAmountProfitSV.centerXConstraint(parentView: headerView)
        simulationGrossAmountProfitSV.bottomConstraint(parentView: headerView)

        simulationGrossAmountProfitDescriptionLB.heightConstraint(constant: 20)
        simulationGrossAmountProfitLB.heightConstraint(constant: 20)
    }

    private func setupInvestedAmountConstraints() {
        investedAmountSV.topConstraint(parentView: mainBodyView)
        investedAmountSV.leftConstraint(parentView: mainBodyView)
        investedAmountSV.rightConstraint(parentView: mainBodyView)

        investedAmountDescriptionLB.heightConstraint(constant: 20)
        investedAmountLB.heightConstraint(constant: 20)
    }

    private func setupGrossAmountConstraints() {
        grossAmountSV.overConstraint(topItem: investedAmountSV, constant: 10)
        grossAmountSV.leftConstraint(parentView: mainBodyView)
        grossAmountSV.rightConstraint(parentView: mainBodyView)

        grossAmountDescriptionLB.heightConstraint(constant: 20)
        grossAmountLB.heightConstraint(constant: 20)
    }

    private func setupGrossAmountProfitConstraints() {
        grossAmountProfitSV.overConstraint(topItem: grossAmountSV, constant: 10)
        grossAmountProfitSV.leftConstraint(parentView: mainBodyView)
        grossAmountProfitSV.rightConstraint(parentView: mainBodyView)

        grossAmountProfitDescriptionLB.heightConstraint(constant: 20)
        grossAmountProfitLB.heightConstraint(constant: 20)
    }

    private func setupTaxesAmountConstraints() {
        taxesAmountSV.overConstraint(topItem: grossAmountProfitSV, constant: 10)
        taxesAmountSV.leftConstraint(parentView: mainBodyView)
        taxesAmountSV.rightConstraint(parentView: mainBodyView)

        taxesAmountDescriptionLB.heightConstraint(constant: 20)
        taxesAmountLB.heightConstraint(constant: 20)
    }

    private func setupNetAmountConstraints() {
        netAmountSV.overConstraint(topItem: taxesAmountSV, constant: 10)
        netAmountSV.leftConstraint(parentView: mainBodyView)
        netAmountSV.rightConstraint(parentView: mainBodyView)
        netAmountSV.bottomConstraint(parentView: mainBodyView)

        netAmountDescriptionLB.heightConstraint(constant: 20)
        netAmountLB.heightConstraint(constant: 20)
    }

    private func setupMaturityDateConstraints() {
        maturityDateSV.topConstraint(parentView: secondaryBodyView)
        maturityDateSV.leftConstraint(parentView: secondaryBodyView)
        maturityDateSV.rightConstraint(parentView: secondaryBodyView)

        maturityDateDescriptionLB.heightConstraint(constant: 20)
        maturityDateLB.heightConstraint(constant: 20)
    }

    private func setupMaturityTotalDaysConstraints() {
        maturityTotalDaysSV.overConstraint(topItem: maturityDateSV, constant: 10)
        maturityTotalDaysSV.leftConstraint(parentView: secondaryBodyView)
        maturityTotalDaysSV.rightConstraint(parentView: secondaryBodyView)

        maturityTotalDaysDescriptionLB.heightConstraint(constant: 20)
        maturityTotalDaysLB.heightConstraint(constant: 20)
    }

    private func setupMonthlyGrossRateProfitConstraints() {
        monthlyGrossRateProfitSV.overConstraint(topItem: maturityTotalDaysSV, constant: 10)
        monthlyGrossRateProfitSV.leftConstraint(parentView: secondaryBodyView)
        monthlyGrossRateProfitSV.rightConstraint(parentView: secondaryBodyView)

        monthlyGrossRateProfitDescriptionLB.heightConstraint(constant: 20)
        monthlyGrossRateProfitLB.heightConstraint(constant: 20)
    }

    private func setupCdiPercentageConstraints() {
        cdiPercentageSV.overConstraint(topItem: monthlyGrossRateProfitSV, constant: 10)
        cdiPercentageSV.leftConstraint(parentView: secondaryBodyView)
        cdiPercentageSV.rightConstraint(parentView: secondaryBodyView)

        cdiPercentageDescriptionLB.heightConstraint(constant: 20)
        cdiPercentageLB.heightConstraint(constant: 20)
    }

    private func setupYearlyInterestRateConstraints() {
        yearlyInterestRateSV.overConstraint(topItem: cdiPercentageSV, constant: 10)
        yearlyInterestRateSV.leftConstraint(parentView: secondaryBodyView)
        yearlyInterestRateSV.rightConstraint(parentView: secondaryBodyView)

        yearlyInterestRateDescriptionLB.heightConstraint(constant: 20)
        yearlyInterestRateLB.heightConstraint(constant: 20)
    }

    private func setupPeriodRateProfitConstraints() {
        periodRateProfitSV.overConstraint(topItem: yearlyInterestRateSV, constant: 10)
        periodRateProfitSV.leftConstraint(parentView: secondaryBodyView)
        periodRateProfitSV.rightConstraint(parentView: secondaryBodyView)

        periodRateProfitDescriptionLB.heightConstraint(constant: 20)
        periodRateProfitLB.heightConstraint(constant: 20)
    }

    private func setupSimulateAgainBTConstraints() {
        simulateAgainBT.heightConstraint(constant: 50)
    }

    func setup() {
        backgroundColor = .white
    }
}
