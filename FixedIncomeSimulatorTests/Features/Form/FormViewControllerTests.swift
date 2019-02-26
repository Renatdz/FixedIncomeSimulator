//
//  FormViewControllerTests.swift
//  FixedIncomeSimulatorTests
//
//  Created by renato.mendes on 25/02/19.
//

import Quick
import Nimble

@testable import FixedIncomeSimulator

final class FormViewControllerTests: QuickSpec {
    override func spec() {
        describe("FormViewControllerTests") {
            var sut: FormViewController!

            context("when you tried to instantiate FormViewController with coder") {
                beforeEach {
                    let coder = NSCoder()
                    sut = FormViewController(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }
        }
    }
}
