//
//  FormViewController.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormViewController: UIViewController {
    private let formViewModel: FormViewModel
    private let formView: FormView

    init(viewModel: FormViewModel) {
        formViewModel = viewModel
        formView = FormView()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

// MARK: - Lifecycle
extension FormViewController {
    override func loadView() {
        super.loadView()
        view = formView
        formView.delegate = self
    }
}

// MARK: - FormViewDelegate
extension FormViewController: FormViewDelegate {
    func simulateWasPressed(investedValue: String, investimentDueDate: String, cdiPercentage: String) {
        formView.showLoading()
        formViewModel.simulateIncome(investedValue: investedValue,
                                     investimentDueDate: investimentDueDate,
                                     cdiPercentage: cdiPercentage) { [unowned self] error in
                                        self.formView.hideLoading()
                                        guard let error = error else { return }
                                        let alertView = ErrorView(message: error.localizedDescription)
                                        alertView.show(in: self)
        }
    }
}
