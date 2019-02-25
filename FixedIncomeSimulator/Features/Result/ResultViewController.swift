//
//  ResultViewController.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 24/02/19.
//

import UIKit

final class ResultViewController: UIViewController {
    private let resultViewModel: ResultViewModel
    private let resultView: ResultView

    init(viewModel: ResultViewModel) {
        resultViewModel = viewModel
        resultView = ResultView()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle
extension ResultViewController {
    override func loadView() {
        super.loadView()
        view = resultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.binding(with: resultViewModel)
    }
}
