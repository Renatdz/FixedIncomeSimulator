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
        return nil
    }
}

// MARK: - Lifecycle
extension ResultViewController {
    override func loadView() {
        super.loadView()
        view = resultView
        resultView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.binding(with: resultViewModel)
    }
}

extension ResultViewController: ResultViewDelegate {
    func simulateAgainWasPressed() {
        resultViewModel.showForm()
    }
}
