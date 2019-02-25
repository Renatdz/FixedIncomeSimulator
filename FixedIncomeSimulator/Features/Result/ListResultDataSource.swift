//
//  ListResultDataSource.swift
//  FixedIncomeSimulator
//
//  Created by renato.mendes on 25/02/19.
//

import UIKit
import Reusable

final class ListResultDataSource: NSObject {
    private(set) var viewModels: [ResultCellViewModel] = []

    func set(_ viewModels: [ResultCellViewModel]) {
        self.viewModels.append(contentsOf: viewModels)
    }
}

extension ListResultDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: viewModels[indexPath.row])
        return cell
    }
}
