//
//  FormCoordinatorTests.swift
//  FixedIncomeSimulatorKIFTests
//
//  Created by renato.mendes on 26/02/19.
//

// swiftlint:disable function_body_length

import Quick
import Nimble
import Nimble_Snapshots
import KIF_Quick
@testable import FixedIncomeSimulator

final class FormCoordinatorTests: KIFSpec {
    override func spec() {
        describe("FormCoordinatorTests") {
            var window: UIWindow!
            var coordinator: FormCoordinator!
            var navigationController: UINavigationController!

            beforeEach {
                navigationController = UINavigationController()
                navigationController.setNavigationBarHidden(true, animated: false)

                window = UIWindow(frame: CGRect(x: 0, y: 0, width: 414, height: 736))
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }

            afterEach {
                window.isHidden = true
                window = nil
            }

            context("when load the app") {
                beforeEach {
                    let fixedIncomeService = FixedIncomeServiceMock(result: .success(Simulation.result()))

                    coordinator = FormCoordinator(service: fixedIncomeService,
                                                  navigationController: navigationController)
                    coordinator.start()
                }

                it("should show form screen") {
                    expect(window).toEventually(haveValidSnapshot(named: "form_view"))
                }
            }

            context("when the fields are empty") {
                beforeEach {
                    let fixedIncomeService = FixedIncomeServiceMock(result: .success(Simulation.result()))

                    coordinator = FormCoordinator(service: fixedIncomeService,
                                                  navigationController: navigationController)
                    coordinator.start()
                }

                it("should show errorView") {
                    viewTester().usingIdentifier("FormView_SimulateBT_Identifier.button").tap()
                    expect(window).toEventually(haveValidSnapshot(named: "form_error_view"))
                }
            }

            context("when the fields are filled") {
                beforeEach {
                    let fixedIncomeService = FixedIncomeServiceMock(result: .success(Simulation.result()))

                    coordinator = FormCoordinator(service: fixedIncomeService,
                                                  navigationController: navigationController)
                    coordinator.start()
                }

                it("should show the fields filled") {
                    viewTester().usingIdentifier("InvestedValue_TextField_Identifier").clearAndEnterText("R$ 1.000")
                    viewTester().usingIdentifier("InvestmentDueDate_TextField_Identifier")
                        .clearAndEnterText("10/10/2023")
                    viewTester().usingIdentifier("CdiPercentage_TextField_Identifier").clearAndEnterText("123%")
                    expect(window).toEventually(haveValidSnapshot(named: "form_filled_view"))
                }
            }

            context("when the fields are filled") {
                beforeEach {
                    let fixedIncomeService = FixedIncomeServiceMock(result: .success(Simulation.result()))

                    coordinator = FormCoordinator(service: fixedIncomeService,
                                                  navigationController: navigationController)
                    coordinator.start()
                }

                it("should redirect to the ResultView") {
                    viewTester().usingIdentifier("InvestedValue_TextField_Identifier").clearAndEnterText("R$ 1.000")
                    viewTester().usingIdentifier("InvestmentDueDate_TextField_Identifier")
                        .clearAndEnterText("10/10/2023")
                    viewTester().usingIdentifier("CdiPercentage_TextField_Identifier").clearAndEnterText("123%")
                    viewTester().usingIdentifier("FormView_SimulateBT_Identifier.button").tap()
                    expect(window).toEventually(haveValidSnapshot(named: "result_filled_view"))
                }
            }

            context("when the fields are filled incorrectly") {
                beforeEach {
                    let fixedIncomeService = FixedIncomeServiceMock(result: .failure(GenericError.noConnection))

                    coordinator = FormCoordinator(service: fixedIncomeService,
                                                  navigationController: navigationController)
                    coordinator.start()
                }

                it("should show errorView") {
                    viewTester().usingIdentifier("InvestedValue_TextField_Identifier").clearAndEnterText("R$ 1.000")
                    viewTester().usingIdentifier("InvestmentDueDate_TextField_Identifier")
                        .clearAndEnterText("10/10/2000")
                    viewTester().usingIdentifier("CdiPercentage_TextField_Identifier").clearAndEnterText("11%")
                    viewTester().usingIdentifier("FormView_SimulateBT_Identifier.button").tap()
                    expect(window).toEventually(haveValidSnapshot(named: "form_serviceError_view"))
                }
            }
        }
    }
}
