//
//  ResultView.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

protocol ResultViewDelegate: class {
    func simulateAgainWasPressed()
}

final class ResultView: UIView {
    weak var delegate: ResultViewDelegate?
    private var listDataSource: ListResultDataSource

    // MARK: - UI Components
    private lazy var contentStackView: DefaultStackView = DefaultStackView(
        distribution: .fill, axis: .vertical, spacing: 30
    )
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

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellType: ResultCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
        tableView.separatorStyle = .none
        tableView.dataSource = listDataSource
        return tableView
    }()

    private lazy var simulateAgainBT: DefaultButton = {
        let button = DefaultButton(title: "Simular novamente")
        button.addTarget(self, action: #selector(simulateAgainBTWasPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Inits
    init(dataSource: ListResultDataSource = ListResultDataSource(), frame: CGRect = .zero) {
        listDataSource = dataSource
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

        let cellViewModels: [ResultCellViewModel] = viewModel.matrixValues.map {
            ResultCellViewModel(description: $0.first, value: $0.last)
        }

        listDataSource.set(cellViewModels)
        tableView.reloadData()
    }
}

// MARK: - Selectors
extension ResultView {
    @objc
    private func simulateAgainBTWasPressed() {
        delegate?.simulateAgainWasPressed()
    }
}

// MARK: - CodableView
extension ResultView: CodableView {
    func buildHierarchy() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(tableView)
        contentStackView.addArrangedSubview(simulateAgainBT)

        headerView.addSubview(simulationResultDescriptionLB)
        headerView.addSubview(simulationGrossAmountLB)
        headerView.addSubview(simulationGrossAmountProfitSV)

        simulationGrossAmountProfitSV.addArrangedSubview(simulationGrossAmountProfitDescriptionLB)
        simulationGrossAmountProfitSV.addArrangedSubview(simulationGrossAmountProfitLB)
    }

    func buildConstraints() {
        setupContentStackViewConstraints()

        setupSimulationResultDescriptionLBConstraints()
        setupSimulationGrossAmountLBConstraints()
        setupSimulationGrossAmountProfitConstraints()

        simulateAgainBT.heightConstraint(constant: 50)
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
        simulationGrossAmountProfitSV.centerXConstraint(parentView: headerView)
        simulationGrossAmountProfitSV.bottomConstraint(parentView: headerView)

        simulationGrossAmountProfitDescriptionLB.heightConstraint(constant: 20)
        simulationGrossAmountProfitLB.heightConstraint(constant: 20)
    }

    func setup() {
        backgroundColor = .white
    }
}
