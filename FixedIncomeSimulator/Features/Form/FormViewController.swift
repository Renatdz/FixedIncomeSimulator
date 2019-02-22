//
//  FormViewController.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormViewController: UIViewController {
    private let formView = FormView()
}

// MARK: - Lifecycle
extension FormViewController {
    override func loadView() {
        super.loadView()
        view = formView
    }
}
