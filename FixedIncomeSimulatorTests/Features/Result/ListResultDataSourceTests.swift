//
//  ListResultDataSourceTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

// swiftlint:disable function_body_length

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ListResultDataSourceTests: QuickSpec {
    override func spec() {
        describe("ListResultDataSourceTests") {
            var sut: ListResultDataSource!
            var tableView: UITableView!
            var cellViewModels: [ResultCellViewModel]!

            beforeSuite {
                let resultViewModel = ResultViewModel(simulation: Simulation.result(), delegate: nil)
                cellViewModels = resultViewModel.matrixValues.map {
                    ResultCellViewModel(description: $0.first, value: $0.last)
                }

                sut = ListResultDataSource()
                tableView = UITableView()
            }

            context("when setViewModels is called") {
                beforeEach {
                    sut.set(cellViewModels)
                }

                afterEach {
                    sut.clear()
                }

                it("should have the right number of viewModels") {
                    expect(sut.viewModels.count) == cellViewModels.count
                }
            }

            context("when clear is called") {
                beforeEach {
                    sut.set(cellViewModels)
                    sut.clear()
                }

                afterEach {
                    sut.clear()
                }

                it("viewModels array should be empty") {
                    expect(sut.viewModels.isEmpty) == true
                }
            }

            context("when numberOfRows is called") {
                beforeEach {
                    sut.set(cellViewModels)
                }

                afterEach {
                    sut.clear()
                }

                it("viewModels array should be empty") {
                    let rows = sut.tableView(tableView, numberOfRowsInSection: 0)
                    expect(rows) == cellViewModels.count
                }
            }

            context("when cellForRow is called") {
                beforeEach {
                    tableView.register(cellType: ResultCell.self)
                    sut.set(cellViewModels)
                }

                afterEach {
                    sut.clear()
                }

                it("cell should be an instance of ResultCell") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    let cell = sut.tableView(tableView, cellForRowAt: indexPath)
                    expect(cell).to(beAKindOf(ResultCell.self))
                }
            }
        }
    }
}
