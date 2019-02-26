//
//  FormCoordinatorTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class FormCoordinatorTests: QuickSpec {
    override func spec() {
        describe("FormCoordinatorTests") {
            var sut: FormCoordinator!
            var navigation: UINavigationController!

            context("when the FormCoordinator is started") {
                beforeEach {
                    navigation = UINavigationController()
                    sut = FormCoordinator(service: FixedIncomeServiceMock(result: .success(Simulation.result())),
                                          navigationController: navigation)
                    sut.start()
                }

                it("should be presented a FormViewController") {
                    expect(navigation.viewControllers.contains {
                        $0.isKind(of: FormViewController.self)
                    }).toEventually(beTrue())
                }
            }

            context("when showResult is called") {
                beforeEach {
                    let simulation: Simulation = Simulation.result()
                    navigation = UINavigationController()
                    sut = FormCoordinator(service: FixedIncomeServiceMock(result: .success(simulation)),
                                          navigationController: navigation)
                    sut.start()
                    sut.showResult(with: simulation)
                }

                it("should be presented a ResultViewController") {
                    expect(navigation.viewControllers.contains {
                        $0.isKind(of: ResultViewController.self)
                    }).toEventually(beTrue())
                }
            }
        }
    }
}
