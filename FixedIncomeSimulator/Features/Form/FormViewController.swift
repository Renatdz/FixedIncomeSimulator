//
//  FormViewController.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 22/02/19.
//

import UIKit

final class FormViewController: UIViewController {
    private let formView: FormView

    init() {
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
