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
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle
extension FormViewController {
    override func loadView() {
        super.loadView()
        view = formView
        formView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - FormViewDelegate
extension FormViewController: FormViewDelegate {
    func simulateWasPressed(investedValue: String, investimentDueDate: String, cdiPercentage: String) {
        formViewModel.simulateIncome(investedValue: investedValue,
                                     investimentDueDate: investimentDueDate,
                                     cdiPercentage: cdiPercentage) { error in
                                        print(error.localizedDescription)
        }
    }
}
