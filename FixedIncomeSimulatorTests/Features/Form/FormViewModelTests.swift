//
//  FormViewModelTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class FormViewModelTests: QuickSpec {
    override func spec() {
        describe("FormViewModelTests") {
            var sut: FormViewModel!
            var formViewModelDelegateMock: FormViewModelDelegateMock!

            context("when simulate is called with a invalid data") {
                beforeEach {
                    formViewModelDelegateMock = FormViewModelDelegateMock()
                    sut = FormViewModel(service: FixedIncomeServiceMock(result: .failure(FormError.invalidForm)),
                                        delegate: formViewModelDelegateMock)
                }

                it("should be returned a invalidData error") {
                    waitUntil { done in
                        sut.simulateIncome(investedValue: "", investimentDueDate: "", cdiPercentage: "") { error in
                            expect(error?.localizedDescription) == FormError.invalidForm.localizedDescription
                            done()
                        }
                    }
                }
            }

            context("when simulate is called with a valid data and success result") {
                beforeEach {
                    formViewModelDelegateMock = FormViewModelDelegateMock()
                    sut = FormViewModel(service: FixedIncomeServiceMock(result: .success(Simulation.result())),
                                        delegate: formViewModelDelegateMock)
                    sut.simulateIncome(investedValue: "R$ 1.000",
                                       investimentDueDate: "10/10/2023",
                                       cdiPercentage: "123%") { _ in }
                }

                it("should be able to call the FormViewModeldelegate") {
                    expect(formViewModelDelegateMock.isShowResultCalled) == true
                }
            }

            context("when simulate is called with a valid data and failure result") {
                beforeEach {
                    formViewModelDelegateMock = FormViewModelDelegateMock()
                    sut = FormViewModel(service: FixedIncomeServiceMock(result: .failure(GenericError.unknown)),
                                        delegate: formViewModelDelegateMock)
                }

                it("should be returned a GenericError") {
                    waitUntil { done in
                        sut.simulateIncome(investedValue: "R$ 1.000",
                                           investimentDueDate: "10/10/2023",
                                           cdiPercentage: "123%") { error in
                            expect(error?.localizedDescription) == GenericError.unknown.localizedDescription
                            done()
                        }
                    }
                }
            }
        }
    }
}
