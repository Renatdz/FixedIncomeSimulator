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
    private lazy var contentStackView: DefaultStackView = {
        return DefaultStackView(distribution: .fill, axis: .vertical, spacing: 40)
    }()

    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let headerResultDescriptionLB: DescriptionLabel = DescriptionLabel(text: "Resultado da simulação")

    private let headerGrossAmountLB: DescriptionLabel = {
        return DescriptionLabel(textColor: .black, font: .systemFont(ofSize: 40, weight: .regular))
    }()

    private let headerGrossAmountProfitSV: DefaultStackView = {
        let stackView = DefaultStackView()
        stackView.alignment = .center
        return stackView
    }()

    private let headerGrossAmountProfitDescriptionLB: DescriptionLabel = {
        return DescriptionLabel(text: "Rendimento total de ", textAlignment: .left)
    }()

    private let headerGrossAmountProfitLB: DescriptionLabel = {
        return DescriptionLabel(textColor: #colorLiteral(red: 0.0, green: 0.8, blue: 0.4, alpha: 1), textAlignment: .left)
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellType: ResultCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.dataSource = listDataSource
        return tableView
    }()

    private(set) lazy var simulateAgainBT: DefaultButton = {
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
        return nil
    }
}

// MARK: - Binding
extension ResultView {
    func binding(with viewModel: ResultViewModel) {
        headerGrossAmountLB.text = viewModel.grossAmount
        headerGrossAmountProfitLB.text = viewModel.grossAmountProfit

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

        headerView.addSubview(headerResultDescriptionLB)
        headerView.addSubview(headerGrossAmountLB)
        headerView.addSubview(headerGrossAmountProfitSV)

        headerGrossAmountProfitSV.addArrangedSubview(headerGrossAmountProfitDescriptionLB)
        headerGrossAmountProfitSV.addArrangedSubview(headerGrossAmountProfitLB)
    }

    func buildConstraints() {
        setupContentStackViewConstraints()

        setupHeaderResultDescriptionLBConstraints()
        setupHeaderGrossAmountLBConstraints()
        setupHeaderGrossAmountProfitConstraints()

        simulateAgainBT.heightConstraint(constant: 50)
    }

    private func setupContentStackViewConstraints() {
        contentStackView.safeAreaTop(safeAreaView: self, constant: -20, statusBar: true)
        contentStackView.leftConstraint(parentView: self, constant: 20)
        contentStackView.rightConstraint(parentView: self, constant: 20)
        contentStackView.safeAreaBottom(safeAreaView: self, constant: 20)
    }

    private func setupHeaderResultDescriptionLBConstraints() {
        headerResultDescriptionLB.topConstraint(parentView: headerView)
        headerResultDescriptionLB.leftConstraint(parentView: headerView)
        headerResultDescriptionLB.rightConstraint(parentView: headerView)
        headerResultDescriptionLB.heightConstraint(constant: 20)
    }

    private func setupHeaderGrossAmountLBConstraints() {
        headerGrossAmountLB.overConstraint(topItem: headerResultDescriptionLB, constant: 10)
        headerGrossAmountLB.leftConstraint(parentView: headerView)
        headerGrossAmountLB.rightConstraint(parentView: headerView)
    }

    private func setupHeaderGrossAmountProfitConstraints() {
        headerGrossAmountProfitSV.overConstraint(topItem: headerGrossAmountLB, constant: 10)
        headerGrossAmountProfitSV.centerXConstraint(parentView: headerView)
        headerGrossAmountProfitSV.bottomConstraint(parentView: headerView)

        headerGrossAmountProfitDescriptionLB.heightConstraint(constant: 20)
        headerGrossAmountProfitLB.heightConstraint(constant: 20)
    }

    func setup() {
        backgroundColor = .white
    }
}
