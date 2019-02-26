//
//  ResultCoordinatorTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 26/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class ResultCoordinatorTests: QuickSpec {
    override func spec() {
        describe("ResultCoordinatorTests") {
            var sut: ResultCoordinator!
            var navigation: UINavigationController!

            context("when the ResultCoordinator is started") {
                beforeEach {
                    let simulation: Simulation = Simulation.result()
                    navigation = UINavigationController()
                    sut = ResultCoordinator(simulation: simulation,
                                            service: FixedIncomeServiceMock(result: .success(simulation)),
                                            navigationController: navigation)
                    sut.start()
                }

                it("should be presented a ResultViewController") {
                    expect(navigation.viewControllers.contains {
                        $0.isKind(of: ResultViewController.self)
                    }).toEventually(beTrue())
                }
            }

            context("when showForm is called") {
                beforeEach {
                    let simulation: Simulation = Simulation.result()
                    navigation = UINavigationController()
                    sut = ResultCoordinator(simulation: simulation,
                                            service: FixedIncomeServiceMock(result: .success(Simulation.result())),
                                            navigationController: navigation)
                    sut.start()
                    sut.showForm()
                }

                it("should be presented a FormViewController") {
                    expect(navigation.viewControllers.contains {
                        $0.isKind(of: FormViewController.self)
                    }).toEventually(beTrue())
                }
            }
        }
    }
}
