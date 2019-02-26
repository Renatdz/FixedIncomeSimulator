//
//  FormViewTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import FixedIncomeSimulator

final class FormViewTests: QuickSpec {
    override func spec() {
        describe("FormViewTests") {
            var sut: FormView!

            context("when you tried to instantiate FormView with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = FormView(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {
                beforeEach {
                    sut = FormView()
                    sut.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when formView call the FormViewDelegate") {
                var formViewDelegateMock: FormViewDelegateMock!

                beforeEach {
                    formViewDelegateMock = FormViewDelegateMock()
                    sut = FormView()
                    sut.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
                    sut.delegate = formViewDelegateMock
                    sut.simulateBT.sendActions(for: .touchUpInside)
                }

                it("formViewDelegate should be called") {
                    expect(formViewDelegateMock.isSimulateWasPressedCalled) == true
                }
            }
        }
    }
}
